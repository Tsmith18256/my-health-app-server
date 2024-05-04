defmodule MyHealthAppServerWeb.BodyCompEntryController do
  use MyHealthAppServerWeb, :controller

  alias MyHealthAppServer.BodyComp
  alias MyHealthAppServer.BodyComp.BodyCompEntry

  action_fallback MyHealthAppServerWeb.FallbackController

  def index(conn, params) do
    entries = BodyComp.list_body_comp_entries(params)

    render(conn, :index, body_comp_entries: entries)
  end

  def show(conn, %{"id" => id}) do
    entry = BodyComp.get_body_comp_entry!(id)

    render(conn, :show, body_comp_entry: entry)
  end

  def create(conn, %{"entry" => entry_params}) do
    attrs = convert_entry(entry_params)

    with {:ok, %BodyCompEntry{} = entry} <- BodyComp.create_body_comp_entry(attrs) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/v1/bodycompentries/#{entry}")
      |> render(:show, body_comp_entry: entry)
    end
  end

  def update(%Plug.Conn{method: method} = conn, %{"id" => id, "entry" => entry_params}) do
    entry = BodyComp.get_body_comp_entry!(id)
    attrs = convert_entry(entry_params)

    case method do
      "PUT" -> with {:ok, %BodyCompEntry{} = entry} <- BodyComp.update_body_comp_entry(entry, attrs) do
        render(conn, :show, body_comp_entry: entry)
      end

      "PATCH" -> send_resp(conn, :not_implemented, "")
    end
  end

  def delete(conn, %{"id" => id}) do
    entry = BodyComp.get_body_comp_entry!(id)

    with {:ok, %BodyCompEntry{}} <- BodyComp.delete_body_comp_entry(entry) do
      send_resp(conn, :no_content, "")
    end
  end

  defp convert_entry(%{"entryDate" => entry_date, "weightG" => weight_g}) do
    %{
      "entry_date" => entry_date,
      "weight_g" => weight_g
    }
  end
end
