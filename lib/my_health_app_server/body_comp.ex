defmodule MyHealthAppServer.BodyComp do
  @moduledoc """
  The BodyComp context.
  """

  import Ecto.Query, warn: false

  alias MyHealthAppServer.Repo
  alias MyHealthAppServer.BodyComp.BodyCompEntry

  @doc """
  Returns the list of body_comp_entries.

  ## Examples

      iex> list_body_comp_entries()
      [%BodyCompEntry{}, ...]

  """
  def list_body_comp_entries(params) do
    limit = Map.get(params, "limit", 100)
    offset = Map.get(params, "offset", 0)

    query = from BodyCompEntry,
      order_by: [desc: :entry_date],
      limit: ^limit,
      offset: ^offset

    Repo.all(query)
  end
end
