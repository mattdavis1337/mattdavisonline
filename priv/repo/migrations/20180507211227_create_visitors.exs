defmodule Mattdavis.Repo.Migrations.CreateVisitors do
  use Ecto.Migration

  def change do
    create table(:visitors) do
      add :email, :string
      add :name, :string
      add :what, :string

      timestamps()
    end

  end
end
