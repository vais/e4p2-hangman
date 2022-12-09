defmodule Dictionary do
  def word_list do
    "assets/words.txt"
    |> File.read!()
    |> String.split("\n", trim: true)
  end

  def random_word do
    Enum.random(word_list())
  end
end
