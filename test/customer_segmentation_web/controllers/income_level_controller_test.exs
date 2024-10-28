defmodule CustomerSegmentationWeb.IncomeLevelControllerTest do
  use CustomerSegmentationWeb.ConnCase

  import CustomerSegmentation.IncomeLevelsFixtures

  alias CustomerSegmentation.IncomeLevels.IncomeLevel

  @create_attrs %{
    high: 42,
    low: 42
  }
  @update_attrs %{
    high: 43,
    low: 43
  }
  @invalid_attrs %{high: nil, low: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all income_levels", %{conn: conn} do
      conn = get(conn, ~p"/api/income_levels")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create income_level" do
    test "renders income_level when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/income_levels", income_level: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/income_levels/#{id}")

      assert %{
               "id" => ^id,
               "high" => 42,
               "low" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/income_levels", income_level: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update income_level" do
    setup [:create_income_level]

    test "renders income_level when data is valid", %{conn: conn, income_level: %IncomeLevel{id: id} = income_level} do
      conn = put(conn, ~p"/api/income_levels/#{income_level}", income_level: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/income_levels/#{id}")

      assert %{
               "id" => ^id,
               "high" => 43,
               "low" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, income_level: income_level} do
      conn = put(conn, ~p"/api/income_levels/#{income_level}", income_level: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete income_level" do
    setup [:create_income_level]

    test "deletes chosen income_level", %{conn: conn, income_level: income_level} do
      conn = delete(conn, ~p"/api/income_levels/#{income_level}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/income_levels/#{income_level}")
      end
    end
  end

  defp create_income_level(_) do
    income_level = income_level_fixture()
    %{income_level: income_level}
  end
end
