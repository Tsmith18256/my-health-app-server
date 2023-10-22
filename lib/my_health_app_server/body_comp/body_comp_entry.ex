defmodule MyHealthAppServer.BodyComp.BodyCompEntry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "body_comp_entries" do
    field :entry_date, :date
    field :weight_g, :integer
    field :waist_circ_mm, :integer
    field :neck_circ_mm, :integer
    field :chest_skinfold_mm, :integer
    field :ab_skinfold_mm, :integer
    field :thigh_skinfold_mm, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(body_comp_entry, attrs) do
    body_comp_entry
    |> cast(attrs, [:entry_date, :weight_g, :waist_circ_mm, :neck_circ_mm, :chest_skinfold_mm, :ab_skinfold_mm, :thigh_skinfold_mm])
    |> validate_required([:entry_date, :weight_g, :waist_circ_mm, :neck_circ_mm, :chest_skinfold_mm, :ab_skinfold_mm, :thigh_skinfold_mm])
  end
end
