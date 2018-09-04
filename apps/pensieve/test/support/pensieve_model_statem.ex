defmodule PensieveModelStateM do
  use PropCheck
  use PropCheck.StateM

  @impl :proper_statem
  def initial_state() do
    # structure: {system, model}
    {nil, PensieveModel.new()}
  end

  @impl :proper_statem
  def command({_system, %PensieveModel{state: :stopped}}) do
    oneof([
      {:call, Pensieve, :start, []}
    ])
  end

  def command({system, %PensieveModel{state: :empty, memories: memories}}) do
    oneof([
      {:call, Pensieve, :stop, [system]},
      {:call, Pensieve, :store, [system, term()]}
      | if map_size(memories) === 0 do
          []
        else
          [{:call, Pensieve, :load, [system, oneof(Map.keys(memories))]}]
        end
    ])
  end

  def command({system, %PensieveModel{state: {:loaded, _}}}) do
    oneof([
      {:call, Pensieve, :stop, [system]},
      {:call, Pensieve, :store, [system, term()]},
      {:call, Pensieve, :relive, [system]}
    ])
  end

  @impl :proper_statem
  def precondition({_system, %PensieveModel{state: state}}, {:call, _, :start, []}) do
    state == :stopped
  end

  def precondition({_system, %PensieveModel{state: state}}, {:call, _, :stop, [_]}) do
    state != :stopped
  end

  def precondition({_system, %PensieveModel{state: state}}, {:call, _, :store, [_, _]}) do
    state != :stopped
  end

  def precondition({_system, %PensieveModel{state: state}}, {:call, _, :load, [_, _]}) do
    state == :empty
  end

  def precondition({_system, %PensieveModel{state: state}}, {:call, _, :relive, [_]}) do
    case state do
      {:loaded, _} -> true
      _ -> false
    end
  end

  @impl :proper_statem
  def postcondition({_system, _model}, {:call, _, :start, []}, result) do
    is_pid(result)
  end

  def postcondition({system, _model}, {:call, _, :stop, [system]}, result) do
    result == :ok
  end

  def postcondition({system, _model}, {:call, _, :store, [system, _memory]}, result) do
    is_reference(result)
  end

  def postcondition({system, %PensieveModel{memories: m}}, {:call, _, :load, [system, memory_ref]}, result) do
    Map.has_key?(m, memory_ref) and result == :ok
  end

  def postcondition({system, model}, {:call, _, :relive, [system]}, result) do
    with {:ok, value} <- result,
         {:ok, ^value, _} <- PensieveModel.relive(model) do
      true
    else
      _ ->
        false
    end
  end

  @impl :proper_statem
  def next_state({_system, model}, system, {:call, _, :start, []}) do
    {:ok, model} = PensieveModel.start(model)
    {system, model}
  end

  def next_state({system, model}, _var, {:call, _, :stop, [system]}) do
    {:ok, model} = PensieveModel.stop(model)
    {nil, model}
  end

  def next_state({system, model}, memory_ref, {:call, _, :store, [system, memory]}) do
    {:ok, model} = PensieveModel.store(model, memory_ref, memory)
    {system, model}
  end

  def next_state({system, model}, _var, {:call, _, :load, [system, memory_ref]}) do
    {:ok, model} = PensieveModel.load(model, memory_ref)
    {system, model}
  end

  def next_state({system, model}, _var, {:call, _, :relive, [system]}) do
    {:ok, _, model} = PensieveModel.relive(model)
    {system, model}
  end
end
