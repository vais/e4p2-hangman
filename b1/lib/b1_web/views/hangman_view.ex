defmodule B1Web.HangmanView do
  use B1Web, :view

  defdelegate figure_for(turns_left, game_state), to: B1Web.HangmanView.FigureFor

  def make_move_or_play_again(conn, status) when status in [:won, :lost] do
    button("Play Again", to: Routes.hangman_path(conn, :new))
  end

  def make_move_or_play_again(conn, _status) do
    form_for(
      conn,
      Routes.hangman_path(conn, :update),
      [method: :put, as: :make_move],
      fn form ->
        [
          text_input(form, :guess,
            autocomplete: "off",
            autofocus: true,
            maxlength: 1
          ),
          submit("Make move")
        ]
      end
    )
  end
end
