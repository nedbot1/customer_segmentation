defmodule CustomerSegmentationWeb.RespondentJSON do
  alias CustomerSegmentation.Respondents.Respondent

  @doc """
  Renders a list of respondents.
  """
  def index(%{respondents: respondents}) do
    %{data: for(respondent <- respondents, do: data(respondent))}
  end

  @doc """
  Renders a single respondent.
  """
  def show(%{respondent: respondent}) do
    %{data: data(respondent)}
  end

  defp data(%Respondent{} = respondent) do
    %{
      id: respondent.id,
      gender: respondent.gender,
      age: respondent.age
    }
  end
end
