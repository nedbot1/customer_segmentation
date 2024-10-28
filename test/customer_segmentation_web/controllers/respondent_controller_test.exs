defmodule CustomerSegmentationWeb.RespondentControllerTest do
  use CustomerSegmentationWeb.ConnCase

  import CustomerSegmentation.RespondentsFixtures

  alias CustomerSegmentation.Respondents.Respondent

  @create_attrs %{
    gender: "some gender",
    age: 42
  }
  @update_attrs %{
    gender: "some updated gender",
    age: 43
  }
  @invalid_attrs %{gender: nil, age: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all respondents", %{conn: conn} do
      conn = get(conn, ~p"/api/respondents")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create respondent" do
    test "renders respondent when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/respondents", respondent: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/respondents/#{id}")

      assert %{
               "id" => ^id,
               "age" => 42,
               "gender" => "some gender"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/respondents", respondent: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update respondent" do
    setup [:create_respondent]

    test "renders respondent when data is valid", %{conn: conn, respondent: %Respondent{id: id} = respondent} do
      conn = put(conn, ~p"/api/respondents/#{respondent}", respondent: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/respondents/#{id}")

      assert %{
               "id" => ^id,
               "age" => 43,
               "gender" => "some updated gender"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, respondent: respondent} do
      conn = put(conn, ~p"/api/respondents/#{respondent}", respondent: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete respondent" do
    setup [:create_respondent]

    test "deletes chosen respondent", %{conn: conn, respondent: respondent} do
      conn = delete(conn, ~p"/api/respondents/#{respondent}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/respondents/#{respondent}")
      end
    end
  end

  defp create_respondent(_) do
    respondent = respondent_fixture()
    %{respondent: respondent}
  end
end
