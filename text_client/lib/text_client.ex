defmodule TextClient do
  @spec start(atom) :: :ok
  def start(node) do
    TextClient.Runtime.RemoteHangman.connect(node)
    |> TextClient.Impl.Player.start()
  end
end
