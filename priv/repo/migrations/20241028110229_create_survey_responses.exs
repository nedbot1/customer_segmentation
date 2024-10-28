defmodule CustomerSegmentation.Repo.Migrations.CreateSurveyResponses do
  use Ecto.Migration

  def change do
    create table(:survey_responses, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :date, :date
      add :survey_question_id, references(:survey_questions, on_delete: :nothing, type: :binary_id)
      add :respondent_id, references(:respondents, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:survey_responses, [:survey_question_id])
    create index(:survey_responses, [:respondent_id])
  end
end
