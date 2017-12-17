defmodule Pasti.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :pseudo, :string
      add :token, :string
      add :admin, :boolean, default: false

      timestamps()
    end
  end
end
