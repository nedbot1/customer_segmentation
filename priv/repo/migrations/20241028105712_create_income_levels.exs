defmodule CustomerSegmentation.Repo.Migrations.CreateIncomeLevels do
  use Ecto.Migration

  def change do
    create table(:income_levels, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :low, :integer
      add :high, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
