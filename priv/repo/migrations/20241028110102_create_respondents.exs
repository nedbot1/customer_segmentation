defmodule CustomerSegmentation.Repo.Migrations.CreateRespondents do
  use Ecto.Migration

  def change do
    create table(:respondents, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :gender, :string
      add :age, :integer
      add :profession_id, references(:professions, on_delete: :nothing, type: :binary_id)
      add :dzongkhag_id, references(:dzongkhags, on_delete: :nothing, type: :binary_id)
      add :income_level_id, references(:income_levels, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:respondents, [:profession_id])
    create index(:respondents, [:dzongkhag_id])
    create index(:respondents, [:income_level_id])
  end
end
