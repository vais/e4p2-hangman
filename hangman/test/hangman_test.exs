defmodule HangmanTest do
  use ExUnit.Case
  doctest Hangman

  @tag :skip
  test "greets the world" do
    assert Hangman.hello() == :world
  end
end
