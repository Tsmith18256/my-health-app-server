defmodule MyHealthAppServer.Repo.Migrations.CreateBodyCompEntries do
  use Ecto.Migration

  def change do
    create table(:body_comp_entries) do
      add :entry_date, :date
      add :weight_g, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
