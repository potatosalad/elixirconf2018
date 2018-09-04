defmodule PensieveStateM do
  use PropCheck
  use PropCheck.StateM

  defmodule Data do
    @type t() :: %__MODULE__{
            pensieve: nil | Pensieve.pensieve(),
            memories: %{optional(Pensieve.memory_ref()) => Pensieve.memory()},
            loaded: nil | Pensieve.memory()
          }
    defstruct pensieve: nil, memories: %{}, loaded: nil
  end

  alias __MODULE__.Data

  @impl :proper_statem
  def initial_state() do
    {:stopped, %Data{}}
  end

  @impl :proper_statem
  def command({old_state = :stopped, _data}) do
    calls = [{:empty, {:call, PensieveShim, :start, []}}]
    transition(old_state, calls)
  end

  def command({old_state = :empty, _data = %Data{pensieve: pensieve, memories: memories}}) do
    always_possible = [
      {:stopped, {:call, PensieveShim, :stop, [pensieve]}},
      {:history, {:call, PensieveShim, :store, [pensieve, term()]}},
      {:history, {:call, PensieveShim, :load_unknown, [pensieve, term()]}},
      {:history, {:call, PensieveShim, :relive, [pensieve]}}
    ]

    requires_memories =
      if map_size(memories) === 0 do
        []
      else
        [{:loaded, {:call, PensieveShim, :load_known, [pensieve, oneof(Map.keys(memories))]}}]
      end

    calls = always_possible ++ requires_memories
    transition(old_state, calls)
  end

  def command({old_state = :loaded, _data = %Data{pensieve: pensieve, memories: memories}}) do
    calls = [
      {:stopped, {:call, PensieveShim, :stop, [pensieve]}},
      {:history, {:call, PensieveShim, :store, [pensieve, term()]}},
      {:history, {:call, PensieveShim, :load_unknown, [pensieve, term()]}},
      {:history, {:call, PensieveShim, :load_known, [pensieve, oneof(Map.keys(memories))]}},
      {:empty, {:call, PensieveShim, :relive, [pensieve]}}
    ]

    transition(old_state, calls)
  end

  def weight(_old_state, :stopped, _call) do
    1
  end

  def weight(:empty, :loaded, _call) do
    100
  end

  def weight(_old_state, _new_state, _call) do
    10
  end

  @doc false
  defp transition(old_state, calls) do
    list =
      for {new_state, call_gen} <- calls, into: [] do
        new_state =
          if new_state == :history do
            old_state
          else
            new_state
          end

        {__MODULE__.weight(old_state, new_state, call_gen), call_gen}
      end

    :proper_types.safe_weighted_union(list)
  end

  @impl :proper_statem
  def precondition({:stopped, %Data{pensieve: nil}}, {:call, _, :start, []}) do
    true
  end

  def precondition({old_state, _data}, {:call, _, :start, []}) when old_state != :stopped do
    false
  end

  def precondition({old_state, %Data{pensieve: p1}}, {:call, _, :stop, [p2]}) when old_state != :stopped do
    not is_nil(p1) and not is_nil(p2) and p1 == p2
  end

  def precondition({_old_state, %Data{pensieve: p1}}, {:call, _, :store, [p2, _memory]}) do
    not is_nil(p1) and not is_nil(p2) and p1 == p2
  end

  def precondition({_old_state, %Data{pensieve: p1, memories: m}}, {:call, _, f, [p2, memory_ref]})
      when f in [:load_known, :load_unknown] do
    not is_nil(p1) and not is_nil(p2) and p1 == p2 and (f == :load_unknown or Map.has_key?(m, memory_ref))
  end

  def precondition({_old_state, %Data{pensieve: p1}}, {:call, _, :relive, [p2]}) do
    not is_nil(p1) and not is_nil(p2) and p1 == p2
  end

  @impl :proper_statem
  def postcondition({:stopped, %Data{pensieve: nil}}, {:call, _, :start, []}, pensieve) do
    is_pid(pensieve)
  end

  def postcondition({old_state, %Data{pensieve: p}}, {:call, _, :stop, [p]}, result) when old_state != :stopped do
    result == :ok
  end

  def postcondition({_old_state, %Data{pensieve: p}}, {:call, _, :store, [p, _memory]}, _memory_ref) do
    not is_nil(p)
  end

  def postcondition({old_state, %Data{pensieve: p}}, {:call, _, f, [p, _memory_ref]}, result)
      when f in [:load_known, :load_unknown] do
    case result do
      {:error, :already_loaded} when old_state == :loaded ->
        true

      {:error, :unknown} when f == :load_unknown and old_state == :empty ->
        true

      :ok when f == :load_known ->
        true

      # Race-condition
      {:error, :already_loaded} ->
        false

      # Race-condition
      {:error, :unknown} ->
        false
    end
  end

  def postcondition({old_state, %Data{pensieve: p, loaded: memory}}, {:call, _, :relive, [p]}, result) do
    case result do
      :error when old_state == :empty ->
        true

      {:ok, ^memory} when old_state == :loaded ->
        true

      # Race-condition
      :error ->
        false

      # Race-condition
      {:ok, _bad_memory} ->
        false
    end
  end

  @impl :proper_statem
  def next_state({:stopped, data = %Data{pensieve: nil}}, pensieve, {:call, _, :start, []}) do
    {:empty, %Data{data | pensieve: pensieve}}
  end

  def next_state({_old_state, data = %Data{pensieve: p}}, _var, {:call, _, :stop, [p]}) do
    {:stopped, %Data{data | pensieve: nil, memories: %{}, loaded: nil}}
  end

  def next_state({old_state, data = %Data{pensieve: p, memories: m}}, memory_ref, {:call, _, :store, [p, memory]}) do
    m = Map.put(m, memory_ref, memory)
    {old_state, %Data{data | memories: m}}
  end

  def next_state({:empty, data = %Data{pensieve: p, memories: m}}, _var, {:call, _, :load_known, [p, memory_ref]}) do
    memory = Map.fetch!(m, memory_ref)
    {:loaded, %Data{data | loaded: memory}}
  end

  def next_state({old_state, data = %Data{pensieve: p}}, _var, {:call, _, f, [p, _memory_ref]})
      when f in [:load_known, :load_unknown] do
    {old_state, data}
  end

  def next_state({:loaded, data = %Data{pensieve: p}}, _var, {:call, _, :relive, [p]}) do
    {:empty, %Data{data | loaded: nil}}
  end

  def next_state({old_state, data = %Data{pensieve: p}}, _var, {:call, _, :relive, [p]}) do
    {old_state, data}
  end
end
