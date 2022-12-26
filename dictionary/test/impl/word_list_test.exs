defmodule Dictionary.Impl.WordListTest do
  use ExUnit.Case
  alias Dictionary.Impl.WordList

  test "word_list" do
    state = WordList.word_list()
    assert is_list(state)
    assert length(state) == 8879
  end

  test "random_word" do
    word_list = WordList.word_list()

    word = WordList.random_word(word_list)
    assert word in word_list

    another_word = WordList.random_word(word_list)
    assert word != another_word
  end
end
