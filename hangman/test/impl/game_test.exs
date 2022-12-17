defmodule Hangman.Impl.GameTest do
  use ExUnit.Case
  alias Hangman.Impl.Game

  test "new_game/0" do
    game = Game.new_game()
    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
    assert MapSet.size(game.used) == 0

    another_game = Game.new_game()
    assert another_game.letters != game.letters
  end

  test "new_game/1" do
    game = Game.new_game("hello")
    assert game.letters == ~w[h e l l o]
  end

  test "make_move after already won or lost" do
    for state <- [:won, :lost] do
      game = Game.new_game()
      game = %{game | game_state: state}

      {new_game, tally} = Game.make_move(game, "x")

      assert new_game == game
      assert tally.turns_left == game.turns_left
      assert tally.game_state == game.game_state
      assert tally.letters == game.letters
      assert tally.used == []
    end
  end

  test "make_move with a duplicate guess" do
    game = Game.new_game()
    game = %{game | used: MapSet.put(game.used, "h")}

    {new_game, _tally} = Game.make_move(game, "h")

    assert new_game.game_state == :already_used
  end

  test "make_move with a new guess" do
    game = Game.new_game()
    guess = "x"

    {new_game, _tally} = Game.make_move(game, guess)

    assert guess in new_game.used
  end
end
