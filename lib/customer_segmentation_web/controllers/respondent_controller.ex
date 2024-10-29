defmodule CustomerSegmentationWeb.RespondentController do
  use CustomerSegmentationWeb, :controller

  alias CustomerSegmentation.Respondents
  alias CustomerSegmentation.Respondents.Respondent


  action_fallback CustomerSegmentationWeb.FallbackController

  def index(conn, _params) do
    respondents = Respondents.list_respondents()
    render(conn, :index, respondents: respondents)
  end

  # def create(conn, %{"respondent" => respondent_params}) do
  #   with {:ok, %Respondent{} = respondent} <- Respondents.create_respondent(respondent_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", ~p"/api/respondents/#{respondent}")
  #     |> render(:show, respondent: respondent)
  #   end
  # end
  def create(conn, %{"respondent" => respondent_params}) do
    case CustomerSegmentation.Respondents.create_complete_respondent(respondent_params) do
      {:ok, _result} ->
        conn
        |> put_status(:created)
        |> json(%{message: "Respondent and related data inserted successfully."})

      {:error, _step, reason, _changes} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: reason})
    end
  end


  def show(conn, %{"id" => id}) do
    respondent = Respondents.get_respondent!(id)
    render(conn, :show, respondent: respondent)
  end

  def update(conn, %{"id" => id, "respondent" => respondent_params}) do
    respondent = Respondents.get_respondent!(id)

    with {:ok, %Respondent{} = respondent} <- Respondents.update_respondent(respondent, respondent_params) do
      render(conn, :show, respondent: respondent)
    end
  end

  def delete(conn, %{"id" => id}) do
    respondent = Respondents.get_respondent!(id)

    with {:ok, %Respondent{}} <- Respondents.delete_respondent(respondent) do
      send_resp(conn, :no_content, "")
    end
  end
end
