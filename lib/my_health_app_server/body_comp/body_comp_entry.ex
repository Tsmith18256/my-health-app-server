defmodule MyHealthAppServer.BodyComp.BodyCompEntry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "body_comp_entries" do
    field :entry_date, :date
    field :weight_g, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(body_comp_entry, attrs) do
    body_comp_entry
    |> cast(attrs, [:entry_date, :weight_g])
    |> validate_required([:entry_date, :weight_g])
  end
end
