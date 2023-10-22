defmodule MyHealthAppServer.BodyCompFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyHealthAppServer.BodyComp` context.
  """

  @doc """
  Generate a body_comp_entry.
  """
  def body_comp_entry_fixture(attrs \\ %{}) do
    {:ok, body_comp_entry} =
      attrs
      |> Enum.into(%{
        ab_skinfold_mm: 42,
        chest_skinfold_mm: 42,
        entry_date: ~D[2023-10-21],
        neck_circ_mm: 42,
        thigh_skinfold_mm: 42,
        waist_circ_mm: 42,
        weight_g: 42
      })
      |> MyHealthAppServer.BodyComp.create_body_comp_entry()

    body_comp_entry
  end
end
