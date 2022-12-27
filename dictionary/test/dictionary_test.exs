defmodule DictionaryTest do
  use ExUnit.Case

  test "random_word" do
    word = Dictionary.random_word()
    assert is_binary(word)
  end
end
