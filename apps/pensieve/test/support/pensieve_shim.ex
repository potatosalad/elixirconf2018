defmodule PensieveShim do
  defdelegate open(), to: Pensieve
  defdelegate close(pid), to: Pensieve
  defdelegate remove_memory(pid, memory), to: Pensieve
  defdelegate relive_memory(pid, memory_ref), to: Pensieve

  def relive_bad_memory(pid, memory_ref) do
    relive_memory(pid, memory_ref)
  end
end
