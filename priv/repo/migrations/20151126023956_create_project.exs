defmodule Portfolio.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:project) do
      add :name, :string, [null: false]
      add :description, :string
      add :url, :string, [null: false]
      add :language, :string

      timestamps
    end

    create unique_index(:project, [:name])
    create unique_index(:project, [:url])
  end
end
