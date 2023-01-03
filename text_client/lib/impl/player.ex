defmodule TextClient.Impl.Player do
  @typep game :: Hangman.game()
  @typep tally :: Hangman.tally()
  @typep state :: {game, tally}

  @spec start() :: :ok
  def start(interactor \\ &interact/1) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interactor.({game, tally})
  end

  @spec interact(state) :: :ok
  def interact({_game, _tally = %{game_state: :won}}) do
    IO.puts("Congratulations, you won!")
  end

  def interact({_game, tally = %{game_state: :lost}}) do
    IO.puts("Sorry, you lost... the word was \"#{tally.letters}\"")
  end

  def interact({game, tally}) do
    IO.puts(message_for(tally))
    IO.puts(status_line(tally))

    tally = Hangman.make_move(game, get_guess())
    interact({game, tally})
  end

  def message_for(tally = %{game_state: :initializing}),
    do: "Welcome! I'm thinking of a #{length(tally.letters)} letter word"

  def message_for(%{game_state: :good_guess}),
    do: "Good guess!"

  def message_for(%{game_state: :bad_guess}),
    do: "Sorry, that letter's not in the word"

  def message_for(%{game_state: :already_used}),
    do: "You've already used that letter"

  def status_line(tally) do
    [
      "Word so far: #{tally.letters |> Enum.join(" ")}",
      "Used so far: #{tally.used |> Enum.join(",")}",
      "Turns left: #{tally.turns_left}"
    ]
    |> Enum.join("\t")
  end

  def get_guess do
    IO.gets("Make a guess: ")
    |> accept_input()
  end

  defp accept_input(str) when is_binary(str) do
    str
    |> String.trim()
    |> String.downcase()
  end

  defp accept_input(_), do: nil
end
