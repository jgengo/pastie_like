defmodule Pasti.Repo.Migrations.AddPastes do
  use Ecto.Migration

  def change do
    create table(:pastes) do
      add :filename, :string
      add :user_id, references(:users)
      add :extension, :string
      add :views_count, :integer
      add :expiration_at, :naive_datetime

      timestamps()
    end
  end
end
