defmodule CustomerSegmentationWeb.SurveyQuestionController do
  use CustomerSegmentationWeb, :controller

  alias CustomerSegmentation.SurveyQuestions
  alias CustomerSegmentation.SurveyQuestions.SurveyQuestion

  action_fallback CustomerSegmentationWeb.FallbackController

  def index(conn, _params) do
    survey_questions = SurveyQuestions.list_survey_questions()
    render(conn, :index, survey_questions: survey_questions)
  end

  def create(conn, %{"survey_question" => survey_question_params}) do
    with {:ok, %SurveyQuestion{} = survey_question} <- SurveyQuestions.create_survey_question(survey_question_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/survey_questions/#{survey_question}")
      |> render(:show, survey_question: survey_question)
    end
  end

  def show(conn, %{"id" => id}) do
    survey_question = SurveyQuestions.get_survey_question!(id)
    render(conn, :show, survey_question: survey_question)
  end

  def update(conn, %{"id" => id, "survey_question" => survey_question_params}) do
    survey_question = SurveyQuestions.get_survey_question!(id)

    with {:ok, %SurveyQuestion{} = survey_question} <- SurveyQuestions.update_survey_question(survey_question, survey_question_params) do
      render(conn, :show, survey_question: survey_question)
    end
  end

  def delete(conn, %{"id" => id}) do
    survey_question = SurveyQuestions.get_survey_question!(id)

    with {:ok, %SurveyQuestion{}} <- SurveyQuestions.delete_survey_question(survey_question) do
      send_resp(conn, :no_content, "")
    end
  end
end
