defmodule CustomerSegmentation.IncomeLevels.IncomeLevel do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "income_levels" do
    field :high, :integer
    field :low, :integer
    has_many :respondents, CustomerSegmentation.Respondents.Respondent
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(income_level, attrs) do
    income_level
    |> cast(attrs, [:low, :high])
    |> validate_required([:low, :high])
  end
end
