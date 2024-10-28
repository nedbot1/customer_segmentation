defmodule CustomerSegmentationWeb.SurveyResponseJSON do
  alias CustomerSegmentation.SurveyResponses.SurveyResponse

  @doc """
  Renders a list of survey_responses.
  """
  def index(%{survey_responses: survey_responses}) do
    %{data: for(survey_response <- survey_responses, do: data(survey_response))}
  end

  @doc """
  Renders a single survey_response.
  """
  def show(%{survey_response: survey_response}) do
    %{data: data(survey_response)}
  end

  defp data(%SurveyResponse{} = survey_response) do
    %{
      id: survey_response.id,
      date: survey_response.date
    }
  end
end
