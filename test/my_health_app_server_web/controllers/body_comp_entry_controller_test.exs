defmodule MyHealthAppServerWeb.BodyCompEntryControllerTest do
  use MyHealthAppServerWeb.ConnCase

  import MyHealthAppServer.BodyCompFixtures

  alias MyHealthAppServer.BodyComp.BodyCompEntry

  @create_attrs %{
    entry_date: ~D[2023-10-21],
    weight_g: 42,
    waist_circ_mm: 42,
    neck_circ_mm: 42,
    chest_skinfold_mm: 42,
    ab_skinfold_mm: 42,
    thigh_skinfold_mm: 42
  }
  @update_attrs %{
    entry_date: ~D[2023-10-22],
    weight_g: 43,
    waist_circ_mm: 43,
    neck_circ_mm: 43,
    chest_skinfold_mm: 43,
    ab_skinfold_mm: 43,
    thigh_skinfold_mm: 43
  }
  @invalid_attrs %{entry_date: nil, weight_g: nil, waist_circ_mm: nil, neck_circ_mm: nil, chest_skinfold_mm: nil, ab_skinfold_mm: nil, thigh_skinfold_mm: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all body_comp_entries", %{conn: conn} do
      conn = get(conn, ~p"/api/body_comp_entries")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create body_comp_entry" do
    test "renders body_comp_entry when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/body_comp_entries", body_comp_entry: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/body_comp_entries/#{id}")

      assert %{
               "id" => ^id,
               "ab_skinfold_mm" => 42,
               "chest_skinfold_mm" => 42,
               "entry_date" => "2023-10-21",
               "neck_circ_mm" => 42,
               "thigh_skinfold_mm" => 42,
               "waist_circ_mm" => 42,
               "weight_g" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/body_comp_entries", body_comp_entry: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update body_comp_entry" do
    setup [:create_body_comp_entry]

    test "renders body_comp_entry when data is valid", %{conn: conn, body_comp_entry: %BodyCompEntry{id: id} = body_comp_entry} do
      conn = put(conn, ~p"/api/body_comp_entries/#{body_comp_entry}", body_comp_entry: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/body_comp_entries/#{id}")

      assert %{
               "id" => ^id,
               "ab_skinfold_mm" => 43,
               "chest_skinfold_mm" => 43,
               "entry_date" => "2023-10-22",
               "neck_circ_mm" => 43,
               "thigh_skinfold_mm" => 43,
               "waist_circ_mm" => 43,
               "weight_g" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, body_comp_entry: body_comp_entry} do
      conn = put(conn, ~p"/api/body_comp_entries/#{body_comp_entry}", body_comp_entry: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete body_comp_entry" do
    setup [:create_body_comp_entry]

    test "deletes chosen body_comp_entry", %{conn: conn, body_comp_entry: body_comp_entry} do
      conn = delete(conn, ~p"/api/body_comp_entries/#{body_comp_entry}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/body_comp_entries/#{body_comp_entry}")
      end
    end
  end

  defp create_body_comp_entry(_) do
    body_comp_entry = body_comp_entry_fixture()
    %{body_comp_entry: body_comp_entry}
  end
end
