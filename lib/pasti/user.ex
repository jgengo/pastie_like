defmodule Pasti.User do

  use Ecto.Schema
  import Ecto.Changeset

  alias Pasti.User

  schema "users" do
    field :email,   :string
    field :pseudo,  :string
    field :token,   :string
    field :admin,   :boolean, default: false

    has_many :pastes, Pasti.Paste

    timestamps()
  end


  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:email, :pseudo, :token, :admin])
    |> validate_required([:email, :pseudo, :token])
  end

end