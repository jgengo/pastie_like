defmodule Pasti.Paste do
  
  use Ecto.Schema
  import Ecto.Changeset

  alias Pasti.Paste

  schema "pastes" do
    field :filename,          :string
    field :extension,         :string
    field :kind,              :string
    field :password,          :string
    field :views_count,       :integer
    field :expiration_at,     :naive_datetime

    belongs_to :user, Pasti.User

    timestamps()
  end
  
  @doc false
  def changeset(%Paste{} = paste, attrs \\ %{}) do
    paste
      |> cast(attrs, [:filename, :extension, :expiration_at])
      |> validate_required([:filename, :extension, :expiration_at])
  end
end