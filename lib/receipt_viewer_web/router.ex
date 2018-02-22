defmodule RViewerWeb.Router do
  use RViewerWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", RViewerWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", DecodeController, :new)

    resources("/decode", DecodeController, singleton: true, only: [:create, :new])
  end

  # Other scopes may use custom stacks.
  # scope "/api", RViewerWeb do
  #   pipe_through :api
  # end
end
