defmodule Share.Supervisor do
  @behaviour :supervisor

  # See http://erlang.org/doc/man/supervisor.html
  # for more information on OTP Supervisors
  def start_link() do
    :supervisor.start_link({:local, __MODULE__}, __MODULE__, [])
  end

  @impl :supervisor
  def init([]) do
    child_specs = [
      %{
        id: Share.Repo,
        start: {Share.Repo, :start_link, [[]]},
        restart: :permanent,
        shutdown: 5000,
        type: :supervisor,
        modules: [Share.Repo]
      }
    ]

    child_specs =
      if Mix.env() == :dev do
        child_specs ++ [Plug.Adapters.Cowboy2.child_spec(scheme: :http, plug: Share.GraphQL.Router, options: [port: 4003])]
      else
        child_specs
      end

    sup_flags = %{
      strategy: :one_for_one,
      intensity: 1,
      period: 5
    }

    {:ok, {sup_flags, child_specs}}
  end
end
