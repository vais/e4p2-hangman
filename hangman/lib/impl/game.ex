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
  def make_move(game = %{game_state: state}, _guess)
      when state in [:won, :lost] do
    {game, tally(game)}
  end

  defp tally(game) do
    %{
      turns_left: game.turns_left,
      game_state: game.game_state,
      letters: game.letters,
      used: game.used |> MapSet.to_list() |> Enum.sort()
    }
  end
end
