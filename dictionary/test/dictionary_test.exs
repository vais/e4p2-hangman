defmodule DictionaryTest do
  use ExUnit.Case

  test "start" do
    {:ok, pid} = Dictionary.start_link()
    assert is_pid(pid)
  end

  test "random_word" do
    {:ok, pid} = Dictionary.start_link()
    word = Dictionary.random_word(pid)
    assert is_binary(word)
  end
end
