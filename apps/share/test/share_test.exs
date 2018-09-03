defmodule ShareTest do
  use ExUnit.Case
  doctest Share

  test "greets the world" do
    assert Share.hello() == :world
  end
end
