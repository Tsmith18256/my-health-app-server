defmodule MyHealthAppServerWeb.BodyCompEntryController do
  use MyHealthAppServerWeb, :controller

  alias MyHealthAppServer.BodyComp
  alias MyHealthAppServer.BodyComp.BodyCompEntry

  action_fallback MyHealthAppServerWeb.FallbackController

  def index(conn, params) do
    entries = BodyComp.list_body_comp_entries(params)

    render(conn, :index, body_comp_entries: entries)
  end

  def show(conn, _params) do
    send_resp(conn, 501, "")
  end

  def create(conn, _params) do
    send_resp(conn, 501, "")
  end

  def update(conn, _params) do
    send_resp(conn, 501, "")
  end

  def delete(conn, _params) do
    send_resp(conn, 501, "")
  end
end
