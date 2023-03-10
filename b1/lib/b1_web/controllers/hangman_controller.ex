defmodule B1Web.HangmanController do
  use B1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    game = Hangman.new_game()

    conn
    |> put_session(:game, game)
    |> redirect(to: Routes.hangman_path(conn, :show))
  end

  def update(conn, %{"make_move" => %{"guess" => ""}}) do
    redirect(conn, to: Routes.hangman_path(conn, :show))
  end

  def update(conn, %{"make_move" => %{"guess" => guess}}) do
    conn
    |> get_session(:game)
    |> Hangman.make_move(guess)

    redirect(conn, to: Routes.hangman_path(conn, :show))
  end

  def show(conn, _params) do
    tally =
      conn
      |> get_session(:game)
      |> Hangman.tally()

    render(conn, "game.html", tally: tally)
  end
end
