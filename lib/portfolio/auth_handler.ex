defmodule Portfolio.AuthHandler do
  use Portfolio.Web, :controller

  def unauthenticated(conn, params) do
    render(conn, Portfolio.ErrorView, "403.html", params)
  end
end
