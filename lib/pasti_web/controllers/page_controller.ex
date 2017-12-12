defmodule PastiWeb.PageController do
  use PastiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
