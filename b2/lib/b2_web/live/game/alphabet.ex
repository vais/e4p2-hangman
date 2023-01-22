defmodule B2Web.Live.Game.Alphabet do
  use B2Web, :live_component

  def mount(socket) do
    letters = Enum.map(?a..?z, &<<&1::utf8>>)
    {:ok, assign(socket, :letters, letters)}
  end

  def render(assigns) do
    ~H"""
    <div class="alphabet">
      <p>
        Turns left: <%= @tally.turns_left %>
      </p>
      <div class="keyboard">
        <%= for letter <- @letters do %>
          <div
            phx-click="make_move"
            phx-value-key={letter}
            class={cls(letter, @tally)}>
            <%= letter %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  defp cls(letter, tally) do
    cond do
      letter in tally.used -> "letter used"
      true -> "letter"
    end
  end
end
