defmodule CustomerSegmentationWeb.SurveyQuestionJSON do
  alias CustomerSegmentation.SurveyQuestions.SurveyQuestion

  @doc """
  Renders a list of survey_questions.
  """
  def index(%{survey_questions: survey_questions}) do
    %{data: for(survey_question <- survey_questions, do: data(survey_question))}
  end

  @doc """
  Renders a single survey_question.
  """
  def show(%{survey_question: survey_question}) do
    %{data: data(survey_question)}
  end

  defp data(%SurveyQuestion{} = survey_question) do
    %{
      id: survey_question.id,
      content: survey_question.content
    }
  end
end
