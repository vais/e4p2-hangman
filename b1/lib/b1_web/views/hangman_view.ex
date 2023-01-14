defmodule B1Web.HangmanView do
  use B1Web, :view

  def figure_for(7) do
    """
     ______
     |    |
          |
          |
          |
          |
          |
    ===========
    👍
    """
  end

  def figure_for(6) do
    """
     ______
     |    |
     |    |
          |
          |
          |
          |
    ===========
    😀
    """
  end

  def figure_for(5) do
    """
     ______
     |    |
     |    |
     0    |
          |
          |
          |
     ===========
    😅
    """
  end

  def figure_for(4) do
    """
     ______
     |    |
     |    |
     0    |
     |    |
          |
          |
    ===========
    🥲
    """
  end

  def figure_for(3) do
    """
     ______
     |    |
     |    |
     0    |
     |\\   |
          |
          |
    ===========
    😨
    """
  end

  def figure_for(2) do
    """
     ______
     |    |
     |    |
     0    |
    /|\\   |
          |
          |
    ===========
    😰
    """
  end

  def figure_for(1) do
    """
     ______
     |    |
     |    |
     0    |
    /|\\   |
      \\   |
          |
    ===========
    😱
    """
  end

  def figure_for(0) do
    """
     ______
     |    |
     |    |
     0    |
    /|\\   |
    / \\   |
          |
    ===========
    😳
    """
  end
end
