defmodule Pensieve.Supervisor do
  @behaviour :supervisor

  # See http://erlang.org/doc/man/supervisor.html
  # for more information on OTP Supervisors
  def start_link() do
    :supervisor.start_link({:local, __MODULE__}, __MODULE__, [])
  end

  def start_child() do
    :supervisor.start_child(__MODULE__, [])
  end

  def terminate_child(pid) do
    :supervisor.terminate_child(__MODULE__, pid)
  end

  def delete_child(pid) do
    :supervisor.delete_child(__MODULE__, pid)
  end

  @impl :supervisor
  def init([]) do
    child_specs = [
      %{
        id: :undefined,
        start: {Pensieve, :start_link, []},
        restart: :temporary,
        shutdown: :brutal_kill,
        type: :worker,
        modules: [Pensieve]
      }
    ]

    sup_flags = %{
      strategy: :simple_one_for_one,
      intensity: 0,
      period: 1
    }

    {:ok, {sup_flags, child_specs}}
  end
end
