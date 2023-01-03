defmodule Hangman do
  alias Hangman.Runtime.Application

  def new_game do
    {:ok, pid} = Application.start_game()
    pid
  end

  def make_move(game, guess) do
    GenServer.call(game, {:make_move, guess})
  end

  def tally(game) do
    GenServer.call(game, {:tally})
  end
end
