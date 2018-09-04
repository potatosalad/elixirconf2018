defmodule PensieveStateM do
  use PropCheck
  use PropCheck.StateM

  @impl :proper_statem
  def initial_state() do
    {nil, %{}}
  end

  @impl :proper_statem
  def command({nil, _memories}) do
    return({:call, PensieveShim, :open, []})
  end

  def command({pid, memories}) do
    always_possible = [
      {80, return({:call, PensieveShim, :remove_memory, [pid, term()]})},
      {20, return({:call, PensieveShim, :relive_bad_memory, [pid, term()]})},
      {5, return({:call, PensieveShim, :close, [pid]})}
    ]

    requires_memories =
      if map_size(memories) === 0 do
        []
      else
        [
          {80, {:call, PensieveShim, :relive_memory, [pid, oneof(Map.keys(memories))]}}
        ]
      end

    frequency(always_possible ++ requires_memories)
  end

  @impl :proper_statem
  def precondition({p1, _memories}, {:call, _, :open, []}) do
    is_nil(p1)
  end

  def precondition({p1, _memories}, {:call, _, :close, [p2]}) do
    not is_nil(p1) and not is_nil(p2) and p1 == p2
  end

  def precondition({p1, _memories}, {:call, _, :remove_memory, [p2, _memory]}) do
    not is_nil(p1) and not is_nil(p2) and p1 == p2
  end

  def precondition({p1, memories}, {:call, _, :relive_memory, [p2, memory_ref]}) do
    not is_nil(p1) and not is_nil(p2) and p1 == p2 and Map.has_key?(memories, memory_ref)
  end

  def precondition({p1, memories}, {:call, _, :relive_bad_memory, [p2, memory_ref]}) do
    not is_nil(p1) and not is_nil(p2) and p1 == p2 and not Map.has_key?(memories, memory_ref)
  end

  @impl :proper_statem
  def postcondition({nil, _memories}, {:call, _, :open, []}, pid) do
    is_pid(pid)
  end

  def postcondition({pid, _memories}, {:call, _, :close, [pid]}, :ok) when not is_nil(pid) do
    true
  end

  def postcondition({pid, _memories}, {:call, _, :remove_memory, [pid, _memory]}, _memory_ref) when not is_nil(pid) do
    true
  end

  def postcondition({pid, memories}, {:call, _, :relive_memory, [pid, memory_ref]}, {:ok, memory}) when not is_nil(pid) do
    case Map.fetch(memories, memory_ref) do
      {:ok, ^memory} -> true
      _ -> false
    end
  end

  def postcondition({pid, _memories}, {:call, _, :relive_memory, [pid, _memory_ref]}, :error) when not is_nil(pid) do
    false
  end

  def postcondition({pid, _memories}, {:call, _, :relive_bad_memory, [pid, _memory_ref]}, :error) when not is_nil(pid) do
    true
  end

  @impl :proper_statem
  def next_state({nil, memories}, pid, {:call, _, :open, []}) do
    {pid, memories}
  end

  def next_state({pid, _memories}, _var, {:call, _, :close, [pid]}) do
    initial_state()
  end

  def next_state({pid, memories}, memory_ref, {:call, _, :remove_memory, [pid, memory]}) do
    new_memories = Map.put(memories, memory_ref, memory)
    {pid, new_memories}
  end

  def next_state(state = {pid, _memories}, _var, {:call, _, :relive_memory, [pid, _memory_ref]}) do
    state
  end

  def next_state(state = {pid, _memories}, _var, {:call, _, :relive_bad_memory, [pid, _memory_ref]}) do
    state
  end
end
