defmodule B2Web.Live.Game do
  use B2Web, :live_view

  alias B2Web.Live.Game

  def mount(_params, _session, socket) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    {:ok, assign(socket, %{game: game, tally: tally})}
  end

  def handle_event("make_move", %{"key" => guess}, socket) do
    tally = Hangman.make_move(socket.assigns.game, guess)
    {:noreply, assign(socket, :tally, tally)}
  end

  def render(assigns) do
    ~L"""
    <div class="game" phx-window-keyup="make_move">
      <%= live_component(Game.Figure, tally: @tally, id: 1)%>
      <%= live_component(Game.WordSoFar, tally: @tally, id: 2)%>
      <%= live_component(Game.Alphabet, tally: @tally, id: 2)%>
    </div>
    """
  end
end
