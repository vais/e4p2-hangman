defmodule Hangman.Impl.Game do
  @type t :: %__MODULE__{
          turns_left: integer,
          game_state: Hangman.state(),
          letters: list(String.t()),
          used: MapSet.t(String.t())
        }

  defstruct turns_left: 7,
            game_state: :initializing,
            letters: [],
            used: MapSet.new()

  def new_game(word \\ Dictionary.random_word()) do
    %__MODULE__{
      letters: word |> String.codepoints()
    }
  end

  def make_move(game, _guess) do
    game
  end
end
