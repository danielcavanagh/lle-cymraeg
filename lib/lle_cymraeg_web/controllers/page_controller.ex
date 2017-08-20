defmodule LleCymraegWeb.PageController do
  use LleCymraegWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
