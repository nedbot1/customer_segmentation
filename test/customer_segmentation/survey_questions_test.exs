defmodule CustomerSegmentation.SurveyQuestionsTest do
  use CustomerSegmentation.DataCase

  alias CustomerSegmentation.SurveyQuestions

  describe "survey_questions" do
    alias CustomerSegmentation.SurveyQuestions.SurveyQuestion

    import CustomerSegmentation.SurveyQuestionsFixtures

    @invalid_attrs %{content: nil}

    test "list_survey_questions/0 returns all survey_questions" do
      survey_question = survey_question_fixture()
      assert SurveyQuestions.list_survey_questions() == [survey_question]
    end

    test "get_survey_question!/1 returns the survey_question with given id" do
      survey_question = survey_question_fixture()
      assert SurveyQuestions.get_survey_question!(survey_question.id) == survey_question
    end

    test "create_survey_question/1 with valid data creates a survey_question" do
      valid_attrs = %{content: "some content"}

      assert {:ok, %SurveyQuestion{} = survey_question} = SurveyQuestions.create_survey_question(valid_attrs)
      assert survey_question.content == "some content"
    end

    test "create_survey_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SurveyQuestions.create_survey_question(@invalid_attrs)
    end

    test "update_survey_question/2 with valid data updates the survey_question" do
      survey_question = survey_question_fixture()
      update_attrs = %{content: "some updated content"}

      assert {:ok, %SurveyQuestion{} = survey_question} = SurveyQuestions.update_survey_question(survey_question, update_attrs)
      assert survey_question.content == "some updated content"
    end

    test "update_survey_question/2 with invalid data returns error changeset" do
      survey_question = survey_question_fixture()
      assert {:error, %Ecto.Changeset{}} = SurveyQuestions.update_survey_question(survey_question, @invalid_attrs)
      assert survey_question == SurveyQuestions.get_survey_question!(survey_question.id)
    end

    test "delete_survey_question/1 deletes the survey_question" do
      survey_question = survey_question_fixture()
      assert {:ok, %SurveyQuestion{}} = SurveyQuestions.delete_survey_question(survey_question)
      assert_raise Ecto.NoResultsError, fn -> SurveyQuestions.get_survey_question!(survey_question.id) end
    end

    test "change_survey_question/1 returns a survey_question changeset" do
      survey_question = survey_question_fixture()
      assert %Ecto.Changeset{} = SurveyQuestions.change_survey_question(survey_question)
    end
  end
end
