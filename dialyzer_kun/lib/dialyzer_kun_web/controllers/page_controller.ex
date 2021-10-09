defmodule DialyzerKunWeb.PageController do
  use DialyzerKunWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
