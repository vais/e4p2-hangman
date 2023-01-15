defmodule B1Web.HangmanView.FigureFor do
  def figure_for(_turns_left, :won) do
    """
     ______
     |    |
          |
          |
          | \\0/
          |  | 
          | / \\
    ===========
    🤩
      you WON!!!
    """
  end

  def figure_for(7, _game_state) do
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

  def figure_for(6, _game_state) do
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

  def figure_for(5, _game_state) do
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

  def figure_for(4, _game_state) do
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

  def figure_for(3, _game_state) do
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

  def figure_for(2, _game_state) do
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

  def figure_for(1, _game_state) do
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

  def figure_for(0, _game_state) do
    """
     ______
     |    |
     |    |
     0    |
    /|\\   |
    / \\   |
          |
    ===========
    😵‍💫
      sorry, but you LOST...
    """
  end
end
