defmodule MyHealthAppServer.Repo do
  use Ecto.Repo,
    otp_app: :my_health_app_server,
    adapter: Ecto.Adapters.Postgres
end
