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

  @doc """
  Gets a single body_comp_entry.

  Raises `Ecto.NoResultsError` if the Body comp entry does not exist.

  ## Examples

      iex> get_body_comp_entry!(123)
      %BodyCompEntry{}

      iex> get_body_comp_entry!(456)
      ** (Ecto.NoResultsError)

  """
  def get_body_comp_entry!(id), do: Repo.get!(BodyCompEntry, id)

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

  @doc """
  Updates a body_comp_entry.

  ## Examples

      iex> update_body_comp_entry(body_comp_entry, %{field: new_value})
      {:ok, %BodyCompEntry{}}

      iex> update_body_comp_entry(body_comp_entry, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_body_comp_entry(%BodyCompEntry{} = body_comp_entry, attrs) do
    body_comp_entry
    |> BodyCompEntry.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a body_comp_entry.

  ## Examples

      iex> delete_body_comp_entry(body_comp_entry)
      {:ok, %BodyCompEntry{}}

      iex> delete_body_comp_entry(body_comp_entry)
      {:error, %Ecto.Changeset{}}

  """
  def delete_body_comp_entry(%BodyCompEntry{} = body_comp_entry) do
    Repo.delete(body_comp_entry)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking body_comp_entry changes.

  ## Examples

      iex> change_body_comp_entry(body_comp_entry)
      %Ecto.Changeset{data: %BodyCompEntry{}}

  """
  def change_body_comp_entry(%BodyCompEntry{} = body_comp_entry, attrs \\ %{}) do
    BodyCompEntry.changeset(body_comp_entry, attrs)
  end
end
