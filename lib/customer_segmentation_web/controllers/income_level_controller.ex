defmodule CustomerSegmentationWeb.IncomeLevelController do
  use CustomerSegmentationWeb, :controller

  alias CustomerSegmentation.IncomeLevels
  alias CustomerSegmentation.IncomeLevels.IncomeLevel

  action_fallback CustomerSegmentationWeb.FallbackController

  def index(conn, _params) do
    income_levels = IncomeLevels.list_income_levels()
    render(conn, :index, income_levels: income_levels)
  end

  def create(conn, %{"income_level" => income_level_params}) do
    with {:ok, %IncomeLevel{} = income_level} <- IncomeLevels.create_income_level(income_level_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/income_levels/#{income_level}")
      |> render(:show, income_level: income_level)
    end
  end

  def show(conn, %{"id" => id}) do
    income_level = IncomeLevels.get_income_level!(id)
    render(conn, :show, income_level: income_level)
  end

  def update(conn, %{"id" => id, "income_level" => income_level_params}) do
    income_level = IncomeLevels.get_income_level!(id)

    with {:ok, %IncomeLevel{} = income_level} <- IncomeLevels.update_income_level(income_level, income_level_params) do
      render(conn, :show, income_level: income_level)
    end
  end

  def delete(conn, %{"id" => id}) do
    income_level = IncomeLevels.get_income_level!(id)

    with {:ok, %IncomeLevel{}} <- IncomeLevels.delete_income_level(income_level) do
      send_resp(conn, :no_content, "")
    end
  end
end
