defmodule B1Web.HangmanView do
  use B1Web, :view

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

  def figure_for(7) do
    """
     ______
     |    |
          |
          |
          |
          |
          |
    ===========
    👍
    """
  end

  def figure_for(6) do
    """
     ______
     |    |
     |    |
          |
          |
          |
          |
    ===========
    😀
    """
  end

  def figure_for(5) do
    """
     ______
     |    |
     |    |
     0    |
          |
          |
          |
     ===========
    😅
    """
  end

  def figure_for(4) do
    """
     ______
     |    |
     |    |
     0    |
     |    |
          |
          |
    ===========
    🥲
    """
  end

  def figure_for(3) do
    """
     ______
     |    |
     |    |
     0    |
     |\\   |
          |
          |
    ===========
    😨
    """
  end

  def figure_for(2) do
    """
     ______
     |    |
     |    |
     0    |
    /|\\   |
          |
          |
    ===========
    😰
    """
  end

  def figure_for(1) do
    """
     ______
     |    |
     |    |
     0    |
    /|\\   |
      \\   |
          |
    ===========
    😱
    """
  end

  def figure_for(0) do
    """
     ______
     |    |
     |    |
     0    |
    /|\\   |
    / \\   |
          |
    ===========
    😳
    """
  end
end
