defmodule ExampleTest do
  use ExUnit.Case, async: false
  use PropCheck

  test "finds smallest element" do
    assert Example.smallest([1, 2]) == 1
    assert Example.smallest([:b, :a]) == :a
    assert Example.smallest([:a, 0]) == 0
  end

  property "finds smallest element", [:verbose] do
    forall list <- non_empty(list(term())) do
      (Example.smallest(list) == model_smallest(list))
      |> measure("List length", length(list))
      |> collect(length(list))
    end
  end

  def model_smallest(list) when is_list(list) and length(list) > 0 do
    List.first(Enum.sort(list))
  end
end
