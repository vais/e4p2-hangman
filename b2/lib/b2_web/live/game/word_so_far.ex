defmodule B2Web.Live.Game.WordSoFar do
  use B2Web, :live_component

  def render(assigns) do
    ~H"""
    <div class="word-so-far">
      <div class="game-state"><%= state_name(@tally.game_state) %></div>
      <div class="letters">
        <%= for ch <- @tally.letters do %>
          <div class={cls(ch)}><%= ch %></div>
        <% end %>
      </div>
    </div>
    """
  end

  defp cls(_ch = "_"), do: "letter"
  defp cls(_ch), do: "letter correct"

  @states %{
    initializing: "Type or click your first guess",
    bad_guess: "That letter's not in the word",
    good_guess: "Good guess!",
    already_used: "You already picked that letter",
    won: "You won!",
    lost: "Sorry, you lost..."
  }

  defp state_name(game_state), do: @states[game_state]
end
