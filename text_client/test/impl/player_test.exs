defmodule TextClient.Impl.PlayerTest do
  use ExUnit.Case
  alias TextClient.Impl.Player

  test "start" do
    assert Player.start() == :ok
  end
end
