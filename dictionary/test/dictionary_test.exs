defmodule DictionaryTest do
  use ExUnit.Case

  test "start" do
    state = Dictionary.start()
    assert is_list(state)
  end

  test "random_word" do
    word_list = ["one", "two", "three"]
    word = Dictionary.random_word(word_list)
    assert word in word_list
  end
end
