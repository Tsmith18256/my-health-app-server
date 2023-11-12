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
  def list_body_comp_entries do
    query = from BodyCompEntry,
      order_by: [desc: :entry_date]

    Repo.all(query)
  end
end
