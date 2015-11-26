defmodule Portfolio.Router do
  use Portfolio.Web, :router

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

  scope "/", Portfolio do
    pipe_through :browser # Use the default browser stack

    resources "/project", ProjectController
  end

  # Other scopes may use custom stacks.
  scope "/api", Portfolio do
     pipe_through :api

     post "/user", UserController, :create
  end
end
