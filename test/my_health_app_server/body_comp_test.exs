defmodule MyHealthAppServer.BodyCompTest do
  use MyHealthAppServer.DataCase

  alias MyHealthAppServer.BodyComp

  describe "body_comp_entries" do
    alias MyHealthAppServer.BodyComp.BodyCompEntry

    import MyHealthAppServer.BodyCompFixtures

    @invalid_attrs %{entry_date: nil, weight_g: nil, waist_circ_mm: nil, neck_circ_mm: nil, chest_skinfold_mm: nil, ab_skinfold_mm: nil, thigh_skinfold_mm: nil}

    test "list_body_comp_entries/0 returns all body_comp_entries" do
      body_comp_entry = body_comp_entry_fixture()
      assert BodyComp.list_body_comp_entries() == [body_comp_entry]
    end

    test "get_body_comp_entry!/1 returns the body_comp_entry with given id" do
      body_comp_entry = body_comp_entry_fixture()
      assert BodyComp.get_body_comp_entry!(body_comp_entry.id) == body_comp_entry
    end

    test "create_body_comp_entry/1 with valid data creates a body_comp_entry" do
      valid_attrs = %{entry_date: ~D[2023-10-21], weight_g: 42, waist_circ_mm: 42, neck_circ_mm: 42, chest_skinfold_mm: 42, ab_skinfold_mm: 42, thigh_skinfold_mm: 42}

      assert {:ok, %BodyCompEntry{} = body_comp_entry} = BodyComp.create_body_comp_entry(valid_attrs)
      assert body_comp_entry.entry_date == ~D[2023-10-21]
      assert body_comp_entry.weight_g == 42
      assert body_comp_entry.waist_circ_mm == 42
      assert body_comp_entry.neck_circ_mm == 42
      assert body_comp_entry.chest_skinfold_mm == 42
      assert body_comp_entry.ab_skinfold_mm == 42
      assert body_comp_entry.thigh_skinfold_mm == 42
    end

    test "create_body_comp_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BodyComp.create_body_comp_entry(@invalid_attrs)
    end

    test "update_body_comp_entry/2 with valid data updates the body_comp_entry" do
      body_comp_entry = body_comp_entry_fixture()
      update_attrs = %{entry_date: ~D[2023-10-22], weight_g: 43, waist_circ_mm: 43, neck_circ_mm: 43, chest_skinfold_mm: 43, ab_skinfold_mm: 43, thigh_skinfold_mm: 43}

      assert {:ok, %BodyCompEntry{} = body_comp_entry} = BodyComp.update_body_comp_entry(body_comp_entry, update_attrs)
      assert body_comp_entry.entry_date == ~D[2023-10-22]
      assert body_comp_entry.weight_g == 43
      assert body_comp_entry.waist_circ_mm == 43
      assert body_comp_entry.neck_circ_mm == 43
      assert body_comp_entry.chest_skinfold_mm == 43
      assert body_comp_entry.ab_skinfold_mm == 43
      assert body_comp_entry.thigh_skinfold_mm == 43
    end

    test "update_body_comp_entry/2 with invalid data returns error changeset" do
      body_comp_entry = body_comp_entry_fixture()
      assert {:error, %Ecto.Changeset{}} = BodyComp.update_body_comp_entry(body_comp_entry, @invalid_attrs)
      assert body_comp_entry == BodyComp.get_body_comp_entry!(body_comp_entry.id)
    end

    test "delete_body_comp_entry/1 deletes the body_comp_entry" do
      body_comp_entry = body_comp_entry_fixture()
      assert {:ok, %BodyCompEntry{}} = BodyComp.delete_body_comp_entry(body_comp_entry)
      assert_raise Ecto.NoResultsError, fn -> BodyComp.get_body_comp_entry!(body_comp_entry.id) end
    end

    test "change_body_comp_entry/1 returns a body_comp_entry changeset" do
      body_comp_entry = body_comp_entry_fixture()
      assert %Ecto.Changeset{} = BodyComp.change_body_comp_entry(body_comp_entry)
    end
  end
end
