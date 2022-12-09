defmodule DictionaryTest do
  use ExUnit.Case
  doctest Dictionary

  test "word_list" do
    word_list = Dictionary.word_list()
    assert length(word_list) == 8879
  end

  test "random_word" do
    word_list = Dictionary.word_list()
    word = Dictionary.random_word()
    another_word = Dictionary.random_word()
    assert word in word_list
    assert word != another_word
  end
end
