defmodule MyHealthAppServerWeb.BodyCompEntryController do
  use MyHealthAppServerWeb, :controller

  alias MyHealthAppServer.BodyComp
  alias MyHealthAppServer.BodyComp.BodyCompEntry

  action_fallback MyHealthAppServerWeb.FallbackController

  def index(conn, _params) do
    body_comp_entries = BodyComp.list_body_comp_entries()
    render(conn, :index, body_comp_entries: body_comp_entries)
  end

  def create(conn, %{"body_comp_entry" => body_comp_entry_params}) do
    with {:ok, %BodyCompEntry{} = body_comp_entry} <- BodyComp.create_body_comp_entry(body_comp_entry_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/body_comp_entries/#{body_comp_entry}")
      |> render(:show, body_comp_entry: body_comp_entry)
    end
  end

  def show(conn, %{"id" => id}) do
    body_comp_entry = BodyComp.get_body_comp_entry!(id)
    render(conn, :show, body_comp_entry: body_comp_entry)
  end

  def update(conn, %{"id" => id, "body_comp_entry" => body_comp_entry_params}) do
    body_comp_entry = BodyComp.get_body_comp_entry!(id)

    with {:ok, %BodyCompEntry{} = body_comp_entry} <- BodyComp.update_body_comp_entry(body_comp_entry, body_comp_entry_params) do
      render(conn, :show, body_comp_entry: body_comp_entry)
    end
  end

  def delete(conn, %{"id" => id}) do
    body_comp_entry = BodyComp.get_body_comp_entry!(id)

    with {:ok, %BodyCompEntry{}} <- BodyComp.delete_body_comp_entry(body_comp_entry) do
      send_resp(conn, :no_content, "")
    end
  end
end
