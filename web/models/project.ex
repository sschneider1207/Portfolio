defmodule Portfolio.Project do
  use Portfolio.Web, :model

  schema "project" do
    field :name, :string
    field :description, :string
    field :url, :string
    field :language, :string

    timestamps
  end

  @required_fields ~w(name url)
  @optional_fields ~w(description language)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:name)
    |> unique_constraint(:url)
  end
end
