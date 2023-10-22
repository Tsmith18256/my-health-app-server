defmodule MyHealthAppServer.Repo.Migrations.CreateBodyCompEntries do
  use Ecto.Migration

  def change do
    create table(:body_comp_entries) do
      add :entry_date, :date
      add :weight_g, :integer
      add :waist_circ_mm, :integer
      add :neck_circ_mm, :integer
      add :chest_skinfold_mm, :integer
      add :ab_skinfold_mm, :integer
      add :thigh_skinfold_mm, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
