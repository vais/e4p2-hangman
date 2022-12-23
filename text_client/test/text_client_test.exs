defmodule TextClientTest do
  use ExUnit.Case
  doctest TextClient

  test "start" do
    assert TextClient.start() == :ok
  end
end
