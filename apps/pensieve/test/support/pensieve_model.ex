defmodule PensieveModel do
  defstruct state: :stopped, memories: %{}

  def new() do
    %__MODULE__{}
  end

  def start(p = %__MODULE__{state: :stopped}) do
    p = %{p | state: :empty, memories: %{}}
    {:ok, p}
  end

  def stop(p = %__MODULE__{state: state}) when state != :stopped do
    p = %{p | state: :stopped, memories: %{}}
    {:ok, p}
  end

  def store(p = %__MODULE__{memories: m}, key, value) do
    m = Map.put(m, key, value)
    p = %{p | memories: m}
    {:ok, p}
  end

  def load(p = %__MODULE__{state: :empty, memories: m}, key) do
    case Map.fetch(m, key) do
      {:ok, value} ->
        p = %{p | state: {:loaded, value}}
        {:ok, p}

      :error ->
        {:error, :unknown}
    end
  end

  def load(%__MODULE__{state: {:loaded, _}}, _key) do
    {:error, :already_loaded}
  end

  def relive(p = %__MODULE__{state: {:loaded, value}}) do
    p = %{p | state: :empty}
    {:ok, value, p}
  end

  def relive(%__MODULE__{state: :empty}) do
    :error
  end
end
