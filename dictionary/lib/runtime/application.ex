defmodule Dictionary.Runtime.Application do
  use Application

  def start(_, _) do
    Dictionary.Runtime.Server.start_link()
  end
end
