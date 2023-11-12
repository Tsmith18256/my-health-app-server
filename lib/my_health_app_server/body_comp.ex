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

  @doc """
  Gets a single body_comp_entry.

  Raises `Ecto.NoResultsError` if the Body comp entry does not exist.

  ## Examples

      iex> get_body_comp_entry!(123)
      %BodyCompEntry{}

      iex> get_body_comp_entry!(456)
      ** (Ecto.NoResultsError)

  """
  def get_body_comp_entry!(id) do
    Repo.get!(BodyCompEntry, id)
  end

  @doc """
  Creates a body_comp_entry.

  ## Examples

      iex> create_body_comp_entry(%{field: value})
      {:ok, %BodyCompEntry{}}

      iex> create_body_comp_entry(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_body_comp_entry(attrs \\ %{}) do
    %BodyCompEntry{}
    |> BodyCompEntry.changeset(attrs)
    |> Repo.insert()
  end
end
