defmodule PensieveFSM do
  use PropCheck
  use PropCheck.FSM

  defmodule Data do
    @type t() :: %__MODULE__{
            pensieve: nil | Pensieve.pensieve(),
            memories: %{optional(Pensieve.memory_ref()) => Pensieve.memory()},
            loaded: nil | Pensieve.memory()
          }
    defstruct pensieve: nil, memories: %{}, loaded: nil
  end

  alias __MODULE__.Data

  @impl :proper_fsm
  def initial_state() do
    :stopped
  end

  @impl :proper_fsm
  def initial_state_data() do
    %Data{}
  end

  # @impl :proper_fsm
  def stopped(_data) do
    [{:empty, {:call, PensieveShim, :start, []}}]
  end

  # @impl :proper_fsm
  def empty(_data = %Data{pensieve: pensieve, memories: memories}) do
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

    always_possible ++ requires_memories
  end

  # @impl :proper_fsm
  def loaded(_data = %Data{pensieve: pensieve, memories: memories}) do
    [
      {:stopped, {:call, PensieveShim, :stop, [pensieve]}},
      {:history, {:call, PensieveShim, :store, [pensieve, term()]}},
      {:history, {:call, PensieveShim, :load_unknown, [pensieve, term()]}},
      {:history, {:call, PensieveShim, :load_known, [pensieve, oneof(Map.keys(memories))]}},
      {:empty, {:call, PensieveShim, :relive, [pensieve]}}
    ]
  end

  # @impl :proper_fsm
  def weight(_old_state, :stopped, _call) do
    1
  end

  def weight(:empty, :loaded, _call) do
    100
  end

  def weight(_old_state, _new_state, _call) do
    10
  end

  @impl :proper_fsm
  def precondition(:stopped, :empty, %Data{pensieve: nil}, {:call, _, :start, []}) do
    true
  end

  def precondition(old_state, :stopped, %Data{pensieve: p1}, {:call, _, :stop, [p2]}) when old_state != :stopped do
    not is_nil(p1) and not is_nil(p2) and p1 == p2
  end

  def precondition(_old_state, _new_state, %Data{pensieve: p1}, {:call, _, :store, [p2, _memory]}) do
    not is_nil(p1) and not is_nil(p2) and p1 == p2
  end

  def precondition(_old_state, _new_state, %Data{pensieve: p1, memories: m}, {:call, _, f, [p2, memory_ref]})
      when f in [:load_known, :load_unknown] do
    not is_nil(p1) and not is_nil(p2) and p1 == p2 and (f == :load_unknown or Map.has_key?(m, memory_ref))
  end

  def precondition(_old_state, _new_state, %Data{pensieve: p1}, {:call, _, :relive, [p2]}) do
    not is_nil(p1) and not is_nil(p2) and p1 == p2
  end

  @impl :proper_fsm
  def postcondition(:stopped, :empty, %Data{pensieve: nil}, {:call, _, :start, []}, pensieve) do
    is_pid(pensieve)
  end

  def postcondition(old_state, :stopped, %Data{pensieve: p}, {:call, _, :stop, [p]}, result) when old_state != :stopped do
    result == :ok
  end

  def postcondition(_old_state, _new_state, %Data{pensieve: p}, {:call, _, :store, [p, _memory]}, _memory_ref) do
    not is_nil(p)
  end

  def postcondition(old_state, _new_state, %Data{pensieve: p}, {:call, _, f, [p, _memory_ref]}, result)
      when f in [:load_known, :load_unknown] do
    case result do
      {:error, :already_loaded} when old_state == :loaded ->
        true

      {:error, :unknown} when f == :load_unknown and old_state == :empty ->
        true

      :ok when f == :load_known ->
        true
    end
  end

  def postcondition(old_state, new_state, %Data{pensieve: p, loaded: memory}, {:call, _, :relive, [p]}, result) do
    case result do
      :error when old_state == :empty ->
        true

      {:ok, ^memory} when old_state == :loaded and new_state == :empty ->
        true
    end
  end

  @impl :proper_fsm
  def next_state_data(:stopped, :empty, data = %Data{pensieve: nil}, pensieve, {:call, _, :start, []}) do
    %Data{data | pensieve: pensieve}
  end

  def next_state_data(_old_state, :stopped, data = %Data{pensieve: p}, _var, {:call, _, :stop, [p]}) do
    %Data{data | pensieve: nil, memories: %{}, loaded: nil}
  end

  def next_state_data(_old_state, _new_state, data = %Data{pensieve: p, memories: m}, memory_ref, {:call, _, :store, [p, memory]}) do
    m = Map.put(m, memory_ref, memory)
    %Data{data | memories: m}
  end

  def next_state_data(:empty, :loaded, data = %Data{pensieve: p, memories: m}, _var, {:call, _, :load_known, [p, memory_ref]}) do
    memory = Map.fetch!(m, memory_ref)
    %Data{data | loaded: memory}
  end

  def next_state_data(_old_state, _new_state, data = %Data{pensieve: p}, _var, {:call, _, f, [p, _memory_ref]})
      when f in [:load_known, :load_unknown] do
    data
  end

  def next_state_data(:empty, :empty, data = %Data{pensieve: p}, _var, {:call, _, :relive, [p]}) do
    data
  end

  def next_state_data(:loaded, :empty, data = %Data{pensieve: p}, _var, {:call, _, :relive, [p]}) do
    %Data{data | loaded: nil}
  end
end
