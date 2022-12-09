defmodule DictionaryTest do
  use ExUnit.Case
  doctest Dictionary

  test "word_list" do
    word_list = Dictionary.word_list()
    assert length(word_list) == 8879
  end
end
