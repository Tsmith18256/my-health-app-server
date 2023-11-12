defmodule MyHealthAppServerWeb.Router do
  use MyHealthAppServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", MyHealthAppServerWeb do
    pipe_through :api

    resources "/bodycompentries", BodyCompEntryController, except: [:edit, :new]
  end
end
