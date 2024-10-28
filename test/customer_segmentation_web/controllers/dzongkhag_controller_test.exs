defmodule CustomerSegmentationWeb.DzongkhagControllerTest do
  use CustomerSegmentationWeb.ConnCase

  import CustomerSegmentation.DzongkhagsFixtures

  alias CustomerSegmentation.Dzongkhags.Dzongkhag

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all dzongkhags", %{conn: conn} do
      conn = get(conn, ~p"/api/dzongkhags")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create dzongkhag" do
    test "renders dzongkhag when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/dzongkhags", dzongkhag: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/dzongkhags/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/dzongkhags", dzongkhag: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update dzongkhag" do
    setup [:create_dzongkhag]

    test "renders dzongkhag when data is valid", %{conn: conn, dzongkhag: %Dzongkhag{id: id} = dzongkhag} do
      conn = put(conn, ~p"/api/dzongkhags/#{dzongkhag}", dzongkhag: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/dzongkhags/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, dzongkhag: dzongkhag} do
      conn = put(conn, ~p"/api/dzongkhags/#{dzongkhag}", dzongkhag: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete dzongkhag" do
    setup [:create_dzongkhag]

    test "deletes chosen dzongkhag", %{conn: conn, dzongkhag: dzongkhag} do
      conn = delete(conn, ~p"/api/dzongkhags/#{dzongkhag}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/dzongkhags/#{dzongkhag}")
      end
    end
  end

  defp create_dzongkhag(_) do
    dzongkhag = dzongkhag_fixture()
    %{dzongkhag: dzongkhag}
  end
end
