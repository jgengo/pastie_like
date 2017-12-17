defmodule PastiWeb.Router do
  use PastiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Pasti.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", PastiWeb do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  scope "/", PastiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PasteController, :new
    resources "/pastes", PasteController, only: [:index, :create]
  end

end
