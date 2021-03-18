defmodule GerpNewTest do
  use ExUnit.Case
  doctest GerpNew

  test "greets the world" do
    assert GerpNew.hello() == :world
  end
end
