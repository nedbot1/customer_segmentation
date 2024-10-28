defmodule CustomerSegmentation.SurveyQuestions.SurveyQuestion do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "survey_questions" do
    field :content, :string
    has_many :survey_responses, CustomerSegmentation.SurveyResponses.SurveyResponse
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(survey_question, attrs) do
    survey_question
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
