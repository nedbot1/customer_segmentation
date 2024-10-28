defmodule CustomerSegmentationWeb.ProfessionController do
  use CustomerSegmentationWeb, :controller

  alias CustomerSegmentation.Professions
  alias CustomerSegmentation.Professions.Profession

  action_fallback CustomerSegmentationWeb.FallbackController

  def index(conn, _params) do
    professions = Professions.list_professions()
    render(conn, :index, professions: professions)
  end

  def create(conn, %{"profession" => profession_params}) do
    with {:ok, %Profession{} = profession} <- Professions.create_profession(profession_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/professions/#{profession}")
      |> render(:show, profession: profession)
    end
  end

  def show(conn, %{"id" => id}) do
    profession = Professions.get_profession!(id)
    render(conn, :show, profession: profession)
  end

  def update(conn, %{"id" => id, "profession" => profession_params}) do
    profession = Professions.get_profession!(id)

    with {:ok, %Profession{} = profession} <- Professions.update_profession(profession, profession_params) do
      render(conn, :show, profession: profession)
    end
  end

  def delete(conn, %{"id" => id}) do
    profession = Professions.get_profession!(id)

    with {:ok, %Profession{}} <- Professions.delete_profession(profession) do
      send_resp(conn, :no_content, "")
    end
  end
end
