defmodule Portfolio.UserController do
  use Portfolio.Web, :controller

  alias Portfolio.User

  def create(conn, params) do
    params
    |> hash_password
    |> gen_changeset
    |> insert_user
    |> put_response(conn)
  end

  defp hash_password(%{"password" => _} = user), do: Comeonin.create_user(user, [extra_chars: false])

  def gen_changeset({:ok, user}), do: User.changeset(%User{}, user)
  def gen_changeset(error), do: error

  defp insert_user(%Ecto.Changeset{} = changeset), do: Repo.insert(changeset)
  defp insert_user(error), do: error

  defp put_response({:ok, _user}, conn), do: send_resp(conn, 201, "")
  defp put_response(error, conn), do: json(conn, error)
end
