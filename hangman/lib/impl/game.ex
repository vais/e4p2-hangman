defmodule Hangman.Impl.Game do
  @type state :: :initializing | :won | :lost | :good_guess | :bad_guess | :already_used

  @type tally :: %{
          turns_left: integer,
          game_state: state,
          letters: [String.t()],
          used: [String.t()]
        }

  @type t :: %__MODULE__{
          turns_left: integer,
          game_state: state,
          letters: [String.t()],
          used: MapSet.t(String.t())
        }

  defstruct turns_left: 7,
            game_state: :initializing,
            letters: [],
            used: MapSet.new()

  @spec new_game :: t
  @spec new_game(String.t()) :: t
  def new_game(word \\ Dictionary.random_word()) do
    %__MODULE__{
      letters: word |> String.codepoints()
    }
  end

  @spec make_move(t, String.t()) :: {t, tally}
  def make_move(game, _guess) do
    game
  end
end
