defmodule Dictionary do
  alias Dictionary.Runtime.Server

  @opaque t :: {:ok, Server.t()}

  @spec start_link :: t
  defdelegate start_link, to: Server

  @spec random_word(t) :: String.t()
  defdelegate random_word(pid), to: Server
end
