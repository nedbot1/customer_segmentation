defmodule CustomerSegmentation.Dzongkhags.Dzongkhag do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "dzongkhags" do
    field :name, :string
    has_many :respondents, CustomerSegmentation.Respondents.Respondent
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dzongkhag, attrs) do
    dzongkhag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
