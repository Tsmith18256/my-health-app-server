defmodule MyHealthAppServerWeb.BodyCompEntryJSON do
  alias MyHealthAppServer.BodyComp.BodyCompEntry

  @doc """
  Renders a list of body_comp_entries.
  """
  def index(%{body_comp_entries: entries}) do
    %{data: for(entry <- entries, do: data(entry))}
  end

  defp data(%BodyCompEntry{} = entry) do
    %{
      id: entry.id,
      entry_date: entry.entry_date,
      weight_g: entry.weight_g
    }
  end
end
