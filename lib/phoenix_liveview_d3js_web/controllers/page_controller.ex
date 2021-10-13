defmodule D3DemoWeb.PageController do
  use D3DemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
