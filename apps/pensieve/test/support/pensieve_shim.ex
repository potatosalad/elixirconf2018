defmodule PensieveShim do
  defdelegate start(), to: Pensieve
  defdelegate stop(pid), to: Pensieve
  defdelegate store(pid, memory), to: Pensieve
  defdelegate load(pid, memory_ref), to: Pensieve
  defdelegate relive(pid), to: Pensieve

  def load_known(pid, memory_ref), do: load(pid, memory_ref)
  def load_unknown(pid, memory_ref), do: load(pid, memory_ref)
end
