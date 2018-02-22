defmodule RViewerWeb.PageController do
  use RViewerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
