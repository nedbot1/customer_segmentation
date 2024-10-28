defmodule CustomerSegmentation.Professions.Profession do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "professions" do
    field :name, :string
    has_many :respondents, CustomerSegmentation.Respondents.Respondent
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(profession, attrs) do
    profession
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
