defmodule Dictionary.Runtime.Server do
  alias Dictionary.Impl.WordList
  use Agent

  @type t :: pid()

  @spec start_link([]) :: t
  def start_link(_opts) do
    Agent.start_link(&WordList.word_list/0, name: __MODULE__)
  end

  @spec random_word() :: String.t()
  def random_word() do
    Agent.get(__MODULE__, &WordList.random_word/1)
  end
end
