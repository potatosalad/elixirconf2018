defmodule PensieveModelTest do
  use ExUnit.Case, async: false
  use PropCheck
  import PropCheck.StateM

  test "pensieve model static" do
    # setup
    {:ok, apps} = Application.ensure_all_started(:pensieve)
    model = PensieveModel.new()
    # start
    system = Pensieve.start()
    assert(is_pid(system))
    assert({:ok, model} = PensieveModel.start(model))
    # store
    value = :memory
    key = Pensieve.store(system, value)
    assert(is_reference(key))
    assert({:ok, model} = PensieveModel.store(model, key, value))
    # load
    assert(:ok = Pensieve.load(system, key))
    assert({:ok, model} = PensieveModel.load(model, key))
    # relive
    assert({:ok, ^value} = Pensieve.relive(system))
    assert({:ok, ^value, model} = PensieveModel.relive(model))
    # stop
    assert(:ok = Pensieve.stop(system))
    assert({:ok, _} = PensieveModel.stop(model))
    # teardown
    for app <- apps, do: Application.stop(app)
  end

  property "pensieve model operations", [:verbose, {:numtests, 100}, {:constraint_tries, 50}] do
    forall(cmds <- commands(PensieveModelStateM)) do
      {:ok, apps} = Application.ensure_all_started(:pensieve)
      {history, state, result} = run_commands(PensieveModelStateM, cmds)
      for app <- apps, do: Application.stop(app)

      (result == :ok)
      |> aggregate(command_names(cmds))
      |> when_fail(print_failure_report(cmds, state, result, history))
    end
  end

  ## NOTE: parallel properties do not work with the simple model example, see PensieveFSMTest and PensieveStateMTest
  # property "pensieve parallel model property", [:verbose, {:numtests, 100}, {:constraint_tries, 50}] do
  #   forall(cmds <- parallel_commands(PensieveModelStateM)) do
  #     {:ok, apps} = Application.ensure_all_started(:pensieve)
  #     {history, state, result} = run_parallel_commands(PensieveModelStateM, cmds)
  #     for app <- apps, do: Application.stop(app)

  #     (result == :ok)
  #     |> aggregate(:proper_statem.zip(:proper_fsm.state_names(history), command_names(cmds)))
  #     |> when_fail(print_failure_report(cmds, state, result, history))
  #   end
  # end

  @doc false
  defp print_failure_report(cmds, state, result, history) do
    IO.puts(
      :io_lib.format(
        <<
          "=======~n",
          "Failing command sequence:~n~s~n",
          "At state: ~s~n",
          "=======~n",
          "Result: ~s~n",
          "History: ~s~n"
        >>,
        [
          inspect(cmds, limit: :infinity, pretty: true),
          inspect(state, limit: :infinity, pretty: true),
          inspect(result, limit: :infinity, pretty: true),
          inspect(history, limit: :infinity, pretty: true)
        ]
      )
    )
  end
end
