defmodule PastiWeb.AuthController do
  
  use PastiWeb, :controller
  plug Ueberauth

  alias Pasti.User
  alias Pasti.Repo

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, pseudo: auth.info.nickname}
    changeset = User.changeset(%User{}, user_params)

    signin(conn, changeset)
  end  

  def signout(conn, _) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Sign out")
    |> redirect(to: paste_path(conn, :new))
  end

  def signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "You are logged in")
        |> put_session(:user_id, user.id)
        |> redirect(to: paste_path(conn, :new))
      {:error, _} ->
        conn
        |> put_flash(:warning, "Something went wrong.")
        |> redirect(to: paste_path(conn, :new))
    end
  end

  def insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end



end