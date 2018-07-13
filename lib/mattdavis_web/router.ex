defmodule MattdavisWeb.Router do
  use MattdavisWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MattdavisWeb do
    pipe_through :browser # Use the default browser stack

    post "/visitors/new", VisitorController, :create
    get "/", PageController, :index
    get "/masterkey", MythController, :index
    get "/purchase", MythController, :sale
    get "/tutoring", PageController, :tutoring
  end

  # Other scopes may use custom stacks.
  # scope "/api", MattdavisWeb do
  #   pipe_through :api
  # end
end
