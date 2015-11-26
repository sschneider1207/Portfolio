defmodule Portfolio.User do
  use Portfolio.Web, :model

  schema "users" do
    field :username, :string
    field :password_hash, :string
    field :email, :string

    timestamps
  end

  @required_fields ~w(username password_hash email)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end
