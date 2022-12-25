defmodule TextClient.Impl.PlayerTest do
  use ExUnit.Case
  alias TextClient.Impl.Player
  import ExUnit.CaptureIO

  test "start" do
    assert Player.start(fn _ -> :ok end) == :ok
  end

  test "when game is won" do
    game = %{Hangman.new_game() | game_state: :won}
    tally = Hangman.tally(game)

    response = capture_io(fn -> Player.interact({game, tally}) end)

    assert response == """
           Congratulations, you won!
           """
  end

  test "when game is lost" do
    game = %{Hangman.new_game("hi") | game_state: :lost}
    tally = Hangman.tally(game)

    response = capture_io(fn -> Player.interact({game, tally}) end)

    assert response == """
           Sorry, you lost... the word was "hi"
           """
  end

  test "message_for :initializing" do
    tally = %{game_state: :initializing, letters: ["a", "b"]}
    msg = Player.message_for(tally)
    assert msg == "Welcome! I'm thinking of a 2 letter word"
  end

  test "message_for :good_guess" do
    tally = %{game_state: :good_guess}
    msg = Player.message_for(tally)
    assert msg == "Good guess!"
  end

  test "message_for :bad_guess" do
    tally = %{game_state: :bad_guess}
    msg = Player.message_for(tally)
    assert msg == "Sorry, that letter's not in the word"
  end

  test "message_for :already_used" do
    tally = %{game_state: :already_used}
    msg = Player.message_for(tally)
    assert msg == "You've already used that letter"
  end

  test "status line" do
    tally = %{letters: ~w[_ _], turns_left: 900, used: ~w[a b c]}
    status_line = Player.status_line(tally)
    assert status_line == "Word so far: _ _\tUsed so far: a,b,c\tTurns left: 900"
  end

  test "prompting for a guess" do
    response = capture_io("A", fn -> IO.write(Player.get_guess()) end)
    assert response === "Make a guess: a"
  end
end
