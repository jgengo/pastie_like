defmodule Pasti.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Pasti.Repo
  alias Pasti.User
  alias Pasti.Router.Helpers

  def init(_p) do
  end

  def call(conn, _p) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end