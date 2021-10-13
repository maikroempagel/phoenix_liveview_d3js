defmodule D3DemoWeb.DemoLive do
  use D3DemoWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end

    {:ok, assign(socket, [])}
  end

  def render(assigns) do
    ~H"""
    <div id="viz_area" phx-hook="Draw"></div>
    """
  end

  def handle_info(:tick, socket) do
    {:noreply, push_event(socket, "color", %{color: random_hex_color()})}
  end

  defp random_hex_color do
    values = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "A", "B", "C", "D", "E", "F"]

    hex_color =
      Enum.map(1..6, fn _ -> Enum.random(values) end)
      |> Enum.join()

    "##{hex_color}"
  end
end
