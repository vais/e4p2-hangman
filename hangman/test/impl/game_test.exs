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

      {new_game, _tally} = Game.make_move(game, "x")

      assert new_game == game
    end
  end

  test "make_move with a duplicate guess" do
    game = Game.new_game()
    game = %{game | used: MapSet.put(game.used, "h")}

    {new_game, _tally} = Game.make_move(game, "h")

    assert new_game.game_state == :already_used
  end

  test "making a good guess" do
    guess = "h"
    game = Game.new_game("hello")
    {new_game, _tally} = Game.make_move(game, guess)
    assert guess in new_game.used
    assert new_game.game_state == :good_guess
  end

  test "winning the game" do
    game = Game.new_game("hello")
    {game, _tally} = Game.make_move(game, "e")
    {game, _tally} = Game.make_move(game, "l")
    {game, _tally} = Game.make_move(game, "o")
    assert game.game_state == :good_guess
    {game, _tally} = Game.make_move(game, "y")
    assert game.game_state == :bad_guess
    {game, _tally} = Game.make_move(game, "h")
    assert game.game_state == :won
  end

  test "making a bad guess" do
    guess = "x"
    game = Game.new_game("hello")
    {new_game, _tally} = Game.make_move(game, guess)
    assert guess in new_game.used
    assert new_game.game_state == :bad_guess
  end

  test "loosing the game" do
    game = Game.new_game("hello")
    {game, _tally} = Game.make_move(game, "a")
    {game, _tally} = Game.make_move(game, "b")
    {game, _tally} = Game.make_move(game, "c")
    {game, _tally} = Game.make_move(game, "d")
    {game, _tally} = Game.make_move(game, "x")
    {game, _tally} = Game.make_move(game, "y")
    assert game.game_state == :bad_guess
    {game, _tally} = Game.make_move(game, "z")
    assert game.game_state == :lost
  end

  test "handling a sequence of moves" do
    [
      ["a", 6, :bad_guess, ~w[_ _ _ _ _], ~w[a]],
      ["a", 6, :already_used, ~w[_ _ _ _ _], ~w[a]],
      ["e", 5, :good_guess, ~w[_ e _ _ _], ~w[a e]],
      ["x", 4, :bad_guess, ~w[_ e _ _ _], ~w[a e x]],
      ["l", 3, :good_guess, ~w[_ e l l _], ~w[a e l x]]
    ]
    |> test_sequence_of_moves
  end

  test "a winning game" do
    [
      ["a", 6, :bad_guess, ~w[_ _ _ _ _], ~w[a]],
      ["a", 6, :already_used, ~w[_ _ _ _ _], ~w[a]],
      ["e", 5, :good_guess, ~w[_ e _ _ _], ~w[a e]],
      ["x", 4, :bad_guess, ~w[_ e _ _ _], ~w[a e x]],
      ["l", 3, :good_guess, ~w[_ e l l _], ~w[a e l x]],
      ["o", 2, :good_guess, ~w[_ e l l o], ~w[a e l o x]],
      ["y", 1, :bad_guess, ~w[_ e l l o], ~w[a e l o x y]],
      ["h", 0, :won, ~w[h e l l o], ~w[a e h l o x y]]
    ]
    |> test_sequence_of_moves
  end

  test "a loosing game" do
    [
      ["a", 6, :bad_guess, ~w[_ _ _ _ _], ~w[a]],
      ["a", 6, :already_used, ~w[_ _ _ _ _], ~w[a]],
      ["e", 5, :good_guess, ~w[_ e _ _ _], ~w[a e]],
      ["x", 4, :bad_guess, ~w[_ e _ _ _], ~w[a e x]],
      ["l", 3, :good_guess, ~w[_ e l l _], ~w[a e l x]],
      ["o", 2, :good_guess, ~w[_ e l l o], ~w[a e l o x]],
      ["y", 1, :bad_guess, ~w[_ e l l o], ~w[a e l o x y]],
      ["r", 0, :lost, ~w[_ e l l o], ~w[a e l o r x y]]
    ]
    |> test_sequence_of_moves
  end

  defp test_sequence_of_moves(moves) do
    Enum.reduce(moves, Game.new_game("hello"), &test_a_move/2)
  end

  defp test_a_move([guess, turns_left, game_state, letters, used], game) do
    {game, tally} = Game.make_move(game, guess)

    assert tally.turns_left == turns_left
    assert tally.game_state == game_state
    assert tally.letters == letters
    assert tally.used == used

    game
  end
end
