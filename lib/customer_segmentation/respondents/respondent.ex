defmodule CustomerSegmentation.Respondents.Respondent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "respondents" do
    field :gender, :string
    field :age, :integer
    belongs_to :profession, CustomerSegmentation.Professions.Profession
    belongs_to :dzongkhag, CustomerSegmentation.Dzongkhags.Dzongkhag
    belongs_to :income_level, CustomerSegmentation.IncomeLevels.IncomeLevel
    has_many :survey_responses, CustomerSegmentation.SurveyResponses.SurveyResponse
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(respondent, attrs) do
    respondent
    |> cast(attrs, [:gender, :age, :profession_id, :dzongkhag_id, :income_level_id])
    |> validate_required([:gender, :age, :profession_id, :dzongkhag_id, :income_level_id])
  end
end
