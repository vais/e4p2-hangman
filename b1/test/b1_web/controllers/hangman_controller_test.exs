defmodule B1Web.HangmanControllerTest do
  use B1Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Hangman!"
  end
end
