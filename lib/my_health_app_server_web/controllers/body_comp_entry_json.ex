defmodule MyHealthAppServerWeb.BodyCompEntryJSON do
  alias MyHealthAppServer.BodyComp.BodyCompEntry

  @doc """
  Renders a list of Body Comp Entries.
  """
  def index(%{body_comp_entries: entries}) do
    %{data: for(entry <- entries, do: data(entry))}
  end

  @doc """
  Renders a single Body Comp Entry.
  """
  def show(%{body_comp_entry: entry}) do
    %{data: data(entry)}
  end

  defp data(%BodyCompEntry{} = entry) do
    %{
      id: entry.id,
      entryDate: entry.entry_date,
      weightG: entry.weight_g
    }
  end
end
