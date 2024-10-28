defmodule CustomerSegmentation.SurveyResponsesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CustomerSegmentation.SurveyResponses` context.
  """

  @doc """
  Generate a survey_response.
  """
  def survey_response_fixture(attrs \\ %{}) do
    {:ok, survey_response} =
      attrs
      |> Enum.into(%{
        date: ~D[2024-10-27]
      })
      |> CustomerSegmentation.SurveyResponses.create_survey_response()

    survey_response
  end
end
