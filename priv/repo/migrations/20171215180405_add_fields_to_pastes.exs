defmodule Pasti.Repo.Migrations.AddFieldsToPastes do
  use Ecto.Migration

  def change do
    alter table(:pastes) do
      add :kind, :string
      add :password, :string
    end
  end
end
