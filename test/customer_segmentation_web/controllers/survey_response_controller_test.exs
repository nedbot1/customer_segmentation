defmodule CustomerSegmentationWeb.SurveyResponseControllerTest do
  use CustomerSegmentationWeb.ConnCase

  import CustomerSegmentation.SurveyResponsesFixtures

  alias CustomerSegmentation.SurveyResponses.SurveyResponse

  @create_attrs %{
    date: ~D[2024-10-27]
  }
  @update_attrs %{
    date: ~D[2024-10-28]
  }
  @invalid_attrs %{date: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all survey_responses", %{conn: conn} do
      conn = get(conn, ~p"/api/survey_responses")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create survey_response" do
    test "renders survey_response when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/survey_responses", survey_response: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/survey_responses/#{id}")

      assert %{
               "id" => ^id,
               "date" => "2024-10-27"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/survey_responses", survey_response: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update survey_response" do
    setup [:create_survey_response]

    test "renders survey_response when data is valid", %{conn: conn, survey_response: %SurveyResponse{id: id} = survey_response} do
      conn = put(conn, ~p"/api/survey_responses/#{survey_response}", survey_response: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/survey_responses/#{id}")

      assert %{
               "id" => ^id,
               "date" => "2024-10-28"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, survey_response: survey_response} do
      conn = put(conn, ~p"/api/survey_responses/#{survey_response}", survey_response: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete survey_response" do
    setup [:create_survey_response]

    test "deletes chosen survey_response", %{conn: conn, survey_response: survey_response} do
      conn = delete(conn, ~p"/api/survey_responses/#{survey_response}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/survey_responses/#{survey_response}")
      end
    end
  end

  defp create_survey_response(_) do
    survey_response = survey_response_fixture()
    %{survey_response: survey_response}
  end
end
