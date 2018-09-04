defmodule Example do
  def smallest([head | tail]) do
    smallest(tail, head)
  end

  defp smallest([head | tail], min) when head < min,
    do: smallest(tail, head)

  defp smallest([_head | tail], min),
    do: smallest(tail, min)

  defp smallest([], min),
    do: min
end
