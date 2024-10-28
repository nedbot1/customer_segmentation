defmodule CustomerSegmentationWeb.ProfessionControllerTest do
  use CustomerSegmentationWeb.ConnCase

  import CustomerSegmentation.ProfessionsFixtures

  alias CustomerSegmentation.Professions.Profession

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
    test "lists all professions", %{conn: conn} do
      conn = get(conn, ~p"/api/professions")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create profession" do
    test "renders profession when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/professions", profession: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/professions/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/professions", profession: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update profession" do
    setup [:create_profession]

    test "renders profession when data is valid", %{conn: conn, profession: %Profession{id: id} = profession} do
      conn = put(conn, ~p"/api/professions/#{profession}", profession: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/professions/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, profession: profession} do
      conn = put(conn, ~p"/api/professions/#{profession}", profession: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete profession" do
    setup [:create_profession]

    test "deletes chosen profession", %{conn: conn, profession: profession} do
      conn = delete(conn, ~p"/api/professions/#{profession}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/professions/#{profession}")
      end
    end
  end

  defp create_profession(_) do
    profession = profession_fixture()
    %{profession: profession}
  end
end
