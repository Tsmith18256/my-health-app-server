defmodule MyHealthAppServerWeb.Router do
  use MyHealthAppServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyHealthAppServerWeb do
    pipe_through :api
  end
end
