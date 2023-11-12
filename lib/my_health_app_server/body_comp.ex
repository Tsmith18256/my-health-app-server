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
    Repo.all(BodyCompEntry)
  end
end
