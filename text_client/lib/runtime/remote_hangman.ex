defmodule TextClient.Runtime.RemoteHangman do
  def connect(node) do
    :rpc.call(node, Hangman, :new_game, [])
  end
end
