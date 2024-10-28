defmodule CustomerSegmentationWeb.DzongkhagController do
  use CustomerSegmentationWeb, :controller

  alias CustomerSegmentation.Dzongkhags
  alias CustomerSegmentation.Dzongkhags.Dzongkhag

  action_fallback CustomerSegmentationWeb.FallbackController

  def index(conn, _params) do
    dzongkhags = Dzongkhags.list_dzongkhags()
    render(conn, :index, dzongkhags: dzongkhags)
  end

  def create(conn, %{"dzongkhag" => dzongkhag_params}) do
    with {:ok, %Dzongkhag{} = dzongkhag} <- Dzongkhags.create_dzongkhag(dzongkhag_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/dzongkhags/#{dzongkhag}")
      |> render(:show, dzongkhag: dzongkhag)
    end
  end

  def show(conn, %{"id" => id}) do
    dzongkhag = Dzongkhags.get_dzongkhag!(id)
    render(conn, :show, dzongkhag: dzongkhag)
  end

  def update(conn, %{"id" => id, "dzongkhag" => dzongkhag_params}) do
    dzongkhag = Dzongkhags.get_dzongkhag!(id)

    with {:ok, %Dzongkhag{} = dzongkhag} <- Dzongkhags.update_dzongkhag(dzongkhag, dzongkhag_params) do
      render(conn, :show, dzongkhag: dzongkhag)
    end
  end

  def delete(conn, %{"id" => id}) do
    dzongkhag = Dzongkhags.get_dzongkhag!(id)

    with {:ok, %Dzongkhag{}} <- Dzongkhags.delete_dzongkhag(dzongkhag) do
      send_resp(conn, :no_content, "")
    end
  end
end
