defmodule CustomerSegmentation.SurveyResponses.SurveyResponse do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "survey_responses" do
    field :date, :date
    belongs_to :survey_question, CustomerSegmentation.SurveyQuestions.SurveyQuestion
    belongs_to :respondent, CustomerSegmentation.Respondents.Respondent
    timestamps(type: :utc_datetime)
  end

  @doc false
 def changeset(survey_response, attrs) do
    survey_response
    |> cast(attrs, [:date, :survey_question_id, :respondent_id])
    |> validate_required([:date, :survey_question_id, :respondent_id])
  end
end
