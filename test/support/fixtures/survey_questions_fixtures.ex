defmodule CustomerSegmentation.SurveyQuestionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CustomerSegmentation.SurveyQuestions` context.
  """

  @doc """
  Generate a survey_question.
  """
  def survey_question_fixture(attrs \\ %{}) do
    {:ok, survey_question} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> CustomerSegmentation.SurveyQuestions.create_survey_question()

    survey_question
  end
end
