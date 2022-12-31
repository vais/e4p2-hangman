defmodule Hangman do
  alias Hangman.Runtime.Server

  def new_game do
    {:ok, pid} = Server.start_link()
    pid
  end

  def make_move(game, guess) do
    GenServer.call(game, {:make_move, guess})
  end

  def tally(game) do
    GenServer.call(game, {:tally})
  end
end
