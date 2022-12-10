defmodule Dictionary do
  @word_list "assets/words.txt"
             |> File.read!()
             |> String.split("\n", trim: true)

  def word_list do
    @word_list
  end

  def random_word do
    Enum.random(word_list())
  end
end
