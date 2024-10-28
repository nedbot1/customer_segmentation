defmodule CustomerSegmentationWeb.SurveyQuestionControllerTest do
  use CustomerSegmentationWeb.ConnCase

  import CustomerSegmentation.SurveyQuestionsFixtures

  alias CustomerSegmentation.SurveyQuestions.SurveyQuestion

  @create_attrs %{
    content: "some content"
  }
  @update_attrs %{
    content: "some updated content"
  }
  @invalid_attrs %{content: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all survey_questions", %{conn: conn} do
      conn = get(conn, ~p"/api/survey_questions")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create survey_question" do
    test "renders survey_question when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/survey_questions", survey_question: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/survey_questions/#{id}")

      assert %{
               "id" => ^id,
               "content" => "some content"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/survey_questions", survey_question: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update survey_question" do
    setup [:create_survey_question]

    test "renders survey_question when data is valid", %{conn: conn, survey_question: %SurveyQuestion{id: id} = survey_question} do
      conn = put(conn, ~p"/api/survey_questions/#{survey_question}", survey_question: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/survey_questions/#{id}")

      assert %{
               "id" => ^id,
               "content" => "some updated content"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, survey_question: survey_question} do
      conn = put(conn, ~p"/api/survey_questions/#{survey_question}", survey_question: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete survey_question" do
    setup [:create_survey_question]

    test "deletes chosen survey_question", %{conn: conn, survey_question: survey_question} do
      conn = delete(conn, ~p"/api/survey_questions/#{survey_question}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/survey_questions/#{survey_question}")
      end
    end
  end

  defp create_survey_question(_) do
    survey_question = survey_question_fixture()
    %{survey_question: survey_question}
  end
end
