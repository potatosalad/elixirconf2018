defmodule Pensieve do
  @behaviour :gen_statem

  def open() do
    {:ok, pid} = Pensieve.Supervisor.start_child()
    pid
  end

  def close(pid) do
    _ = Pensieve.Supervisor.terminate_child(pid)
    _ = Pensieve.Supervisor.delete_child(pid)
    :ok
  end

  def remove_memory(pid, memory) do
    :gen_statem.call(pid, {:remove_memory, memory}, 5000)
  end

  def relive_memory(pid, memory_ref) do
    :gen_statem.call(pid, {:relive_memory, memory_ref}, 5000)
  end

  @doc false
  def start_link() do
    :gen_statem.start_link(__MODULE__, [], [])
  end

  defmodule Data do
    @type t() :: %__MODULE__{memories: %{optional(reference()) => term()}}
    defstruct memories: %{}
  end

  alias __MODULE__.Data

  @impl :gen_statem
  def callback_mode() do
    [:handle_event_function, :state_enter]
  end

  @impl :gen_statem
  def init([]) do
    data = %Data{}
    {:ok, nil, data}
  end

  @impl :gen_statem
  # State Enter Events
  def handle_event(:enter, nil, nil, _data) do
    :keep_state_and_data
  end

  # Call Events
  def handle_event({:call, from}, {:remove_memory, memory}, _state, data = %Data{memories: memories}) do
    memory_ref = :erlang.make_ref()
    new_memories = Map.put_new(memories, memory_ref, memory)
    data = %Data{data | memories: new_memories}
    actions = [{:reply, from, memory_ref}]
    {:keep_state, data, actions}
  end

  def handle_event({:call, from}, {:relive_memory, memory_ref}, _state, _data = %Data{memories: memories}) do
    reply = Map.fetch(memories, memory_ref)
    actions = [{:reply, from, reply}]
    {:keep_state_and_data, actions}
  end
end
