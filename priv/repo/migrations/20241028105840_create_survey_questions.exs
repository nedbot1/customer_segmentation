defmodule CustomerSegmentation.Repo.Migrations.CreateSurveyQuestions do
  use Ecto.Migration

  def change do
    create table(:survey_questions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :content, :text

      timestamps(type: :utc_datetime)
    end
  end
end
