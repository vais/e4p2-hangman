defmodule Hangman do
  alias Hangman.Impl.Game

  @opaque game :: Game.t()

  @spec new_game :: game
  @spec new_game(String.t()) :: game
  defdelegate new_game, to: Game
  defdelegate new_game(word), to: Game

  @spec make_move(game, String.t()) :: {game, Game.tally()}
  defdelegate make_move(game, guess), to: Game

  @spec tally(game) :: Game.tally()
  defdelegate tally(game), to: Game
end
