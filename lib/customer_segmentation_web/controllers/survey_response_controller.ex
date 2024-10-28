defmodule CustomerSegmentationWeb.SurveyResponseController do
  use CustomerSegmentationWeb, :controller

  alias CustomerSegmentation.SurveyResponses
  alias CustomerSegmentation.SurveyResponses.SurveyResponse

  action_fallback CustomerSegmentationWeb.FallbackController

  def index(conn, _params) do
    survey_responses = SurveyResponses.list_survey_responses()
    render(conn, :index, survey_responses: survey_responses)
  end

  def create(conn, %{"survey_response" => survey_response_params}) do
    with {:ok, %SurveyResponse{} = survey_response} <- SurveyResponses.create_survey_response(survey_response_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/survey_responses/#{survey_response}")
      |> render(:show, survey_response: survey_response)
    end
  end

  def show(conn, %{"id" => id}) do
    survey_response = SurveyResponses.get_survey_response!(id)
    render(conn, :show, survey_response: survey_response)
  end

  def update(conn, %{"id" => id, "survey_response" => survey_response_params}) do
    survey_response = SurveyResponses.get_survey_response!(id)

    with {:ok, %SurveyResponse{} = survey_response} <- SurveyResponses.update_survey_response(survey_response, survey_response_params) do
      render(conn, :show, survey_response: survey_response)
    end
  end

  def delete(conn, %{"id" => id}) do
    survey_response = SurveyResponses.get_survey_response!(id)

    with {:ok, %SurveyResponse{}} <- SurveyResponses.delete_survey_response(survey_response) do
      send_resp(conn, :no_content, "")
    end
  end
end
