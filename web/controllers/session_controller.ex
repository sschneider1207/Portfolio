defmodule Portfolio.SessionController do
  use Portfolio.Web, :controller


  def new(conn, _params) do
    conn
    |> assign(:username, nil)
    |> assign(:password, nil)
    |> render("new.html")
  end

  def create(conn, %{"user" => user} = params) do
    alias Portfolio.User

    record = Repo.get_by!(User, username: user["username"])
    if Comeonin.Bcrypt.checkpw(user["password"], record.password_hash) do
      conn
      |> put_flash(:info, "Logged in.")
      |> Guardian.Plug.sign_in(record)
      |> redirect(to: project_path(conn, :index))
    else
      render(conn, Portfolio.ErrorView, "403.html", params)
    end
  end

  def delete(conn, _params) do
    Guardian.Plug.sign_out(conn)
    |> put_flash(:info, "Logged out successfully.")
    |> redirect(to: project_path(conn, :index))
  end
end
