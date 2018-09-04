defmodule Pensieve do
  @behaviour :gen_statem

  @type pensieve() :: pid()
  @type memory() :: term()
  @type memory_ref() :: term()

  @spec start() :: pensieve()
  def start() do
    {:ok, pid} = Pensieve.Supervisor.start_child(:erlang.self())
    pid
  end

  @spec stop(pensieve()) :: :ok
  def stop(pid) do
    _ = Pensieve.Supervisor.terminate_child(pid)
    _ = Pensieve.Supervisor.delete_child(pid)
    :ok
  end

  @spec store(pensieve(), memory()) :: memory_ref()
  def store(pid, memory) do
    :gen_statem.call(pid, {:store, memory}, :infinity)
  end

  @spec load(pensieve(), memory_ref()) :: :ok | {:error, :already_loaded | :unknown}
  def load(pid, memory_ref) do
    :gen_statem.call(pid, {:load, memory_ref}, :infinity)
  end

  @spec relive(pensieve()) :: {:ok, memory()} | :error
  def relive(pid) do
    :gen_statem.call(pid, :relive, :infinity)
  end

  @doc false
  def start_link(parent) do
    :gen_statem.start_link(__MODULE__, [parent], [])
  end

  defmodule Data do
    @type t() :: %__MODULE__{memories: %{optional(reference()) => term()}, parent: {reference(), pid()}}
    defstruct memories: %{}, parent: nil
  end

  alias __MODULE__.Data

  @impl :gen_statem
  def callback_mode() do
    [:handle_event_function, :state_enter]
  end

  @impl :gen_statem
  def init([parent]) do
    monitor_ref = :erlang.monitor(:process, parent)
    data = %Data{parent: {monitor_ref, parent}}
    {:ok, :empty, data}
  end

  @impl :gen_statem
  # State Enter Events
  def handle_event(:enter, :empty, :empty, _data) do
    :keep_state_and_data
  end

  def handle_event(:enter, :empty, {:loaded, _memory}, _data) do
    :keep_state_and_data
  end

  def handle_event(:enter, {:loaded, _memory}, :empty, _data) do
    :keep_state_and_data
  end

  # Call Events
  def handle_event({:call, from}, {:store, memory}, _state, data = %Data{memories: memories}) do
    memory_ref = :erlang.make_ref()
    new_memories = Map.put_new(memories, memory_ref, memory)
    data = %Data{data | memories: new_memories}
    actions = [{:reply, from, memory_ref}]
    {:keep_state, data, actions}
  end

  def handle_event({:call, from}, {:load, memory_ref}, :empty, data = %Data{memories: memories}) do
    case Map.fetch(memories, memory_ref) do
      {:ok, memory} ->
        actions = [{:reply, from, :ok}]
        {:next_state, {:loaded, memory}, data, actions}

      :error ->
        actions = [{:reply, from, {:error, :unknown}}]
        {:keep_state_and_data, actions}
    end
  end

  def handle_event({:call, from}, {:load, _memory_ref}, {:loaded, _memory}, _data) do
    actions = [{:reply, from, {:error, :already_loaded}}]
    {:keep_state_and_data, actions}
  end

  def handle_event({:call, from}, :relive, :empty, _data) do
    actions = [{:reply, from, :error}]
    {:keep_state_and_data, actions}
  end

  def handle_event({:call, from}, :relive, {:loaded, memory}, data) do
    actions = [{:reply, from, {:ok, memory}}]
    {:next_state, :empty, data, actions}
  end

  # Info Events
  def handle_event(:info, {:DOWN, monitor_ref, :process, parent, reason}, _state, _data = %Data{parent: {monitor_ref, parent}}) do
    {:stop, reason}
  end
end
