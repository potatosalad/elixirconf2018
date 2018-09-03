defmodule ShareTest do
  use ExUnit.Case, async: false
  use PropCheck
  import PropCheck.StateM

  property "share stateful operations", [:verbose, {:numtests, 100}, {:constraint_tries, 50}] do
    forall(cmds <- commands(ShareStateM)) do
      {:ok, apps} = Application.ensure_all_started(:share)
      :ok = Share.Repo.truncate()
      {history, state, result} = run_commands(ShareStateM, cmds)
      :ok = Share.Repo.truncate()
      for app <- apps, do: Application.stop(app)

      (result == :ok)
      |> aggregate(command_names(cmds))
      |> when_fail(print_failure_report(cmds, state, result, history))
    end
  end

  property "share parallel stateful property", [:verbose, {:numtests, 100}, {:constraint_tries, 50}] do
    forall(cmds <- parallel_commands(ShareStateM)) do
      {:ok, apps} = Application.ensure_all_started(:share)
      :ok = Share.Repo.truncate()
      {history, state, result} = run_parallel_commands(ShareStateM, cmds)
      :ok = Share.Repo.truncate()
      for app <- apps, do: Application.stop(app)

      (result == :ok)
      |> aggregate(command_names(cmds))
      |> when_fail(print_failure_report(cmds, state, result, history))
    end
  end

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
