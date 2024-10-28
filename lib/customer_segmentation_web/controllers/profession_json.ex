defmodule CustomerSegmentationWeb.ProfessionJSON do
  alias CustomerSegmentation.Professions.Profession

  @doc """
  Renders a list of professions.
  """
  def index(%{professions: professions}) do
    %{data: for(profession <- professions, do: data(profession))}
  end

  @doc """
  Renders a single profession.
  """
  def show(%{profession: profession}) do
    %{data: data(profession)}
  end

  defp data(%Profession{} = profession) do
    %{
      id: profession.id,
      name: profession.name
    }
  end
end
