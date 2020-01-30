defmodule MocksTest do
  use ExUnit.Case
  doctest Mocks

  test "greets the world" do
    assert Mocks.hello() == :world
  end
end
