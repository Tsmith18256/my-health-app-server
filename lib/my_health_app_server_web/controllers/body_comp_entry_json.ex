defmodule MyHealthAppServerWeb.BodyCompEntryJSON do
  alias MyHealthAppServer.BodyComp.BodyCompEntry

  @doc """
  Renders a list of body_comp_entries.
  """
  def index(%{body_comp_entries: body_comp_entries}) do
    %{data: for(body_comp_entry <- body_comp_entries, do: data(body_comp_entry))}
  end

  @doc """
  Renders a single body_comp_entry.
  """
  def show(%{body_comp_entry: body_comp_entry}) do
    %{data: data(body_comp_entry)}
  end

  defp data(%BodyCompEntry{} = body_comp_entry) do
    %{
      id: body_comp_entry.id,
      entry_date: body_comp_entry.entry_date,
      weight_g: body_comp_entry.weight_g,
      waist_circ_mm: body_comp_entry.waist_circ_mm,
      neck_circ_mm: body_comp_entry.neck_circ_mm,
      chest_skinfold_mm: body_comp_entry.chest_skinfold_mm,
      ab_skinfold_mm: body_comp_entry.ab_skinfold_mm,
      thigh_skinfold_mm: body_comp_entry.thigh_skinfold_mm
    }
  end
end
