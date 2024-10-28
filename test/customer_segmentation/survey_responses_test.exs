defmodule CustomerSegmentation.SurveyResponsesTest do
  use CustomerSegmentation.DataCase

  alias CustomerSegmentation.SurveyResponses

  describe "survey_responses" do
    alias CustomerSegmentation.SurveyResponses.SurveyResponse

    import CustomerSegmentation.SurveyResponsesFixtures

    @invalid_attrs %{date: nil}

    test "list_survey_responses/0 returns all survey_responses" do
      survey_response = survey_response_fixture()
      assert SurveyResponses.list_survey_responses() == [survey_response]
    end

    test "get_survey_response!/1 returns the survey_response with given id" do
      survey_response = survey_response_fixture()
      assert SurveyResponses.get_survey_response!(survey_response.id) == survey_response
    end

    test "create_survey_response/1 with valid data creates a survey_response" do
      valid_attrs = %{date: ~D[2024-10-27]}

      assert {:ok, %SurveyResponse{} = survey_response} = SurveyResponses.create_survey_response(valid_attrs)
      assert survey_response.date == ~D[2024-10-27]
    end

    test "create_survey_response/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SurveyResponses.create_survey_response(@invalid_attrs)
    end

    test "update_survey_response/2 with valid data updates the survey_response" do
      survey_response = survey_response_fixture()
      update_attrs = %{date: ~D[2024-10-28]}

      assert {:ok, %SurveyResponse{} = survey_response} = SurveyResponses.update_survey_response(survey_response, update_attrs)
      assert survey_response.date == ~D[2024-10-28]
    end

    test "update_survey_response/2 with invalid data returns error changeset" do
      survey_response = survey_response_fixture()
      assert {:error, %Ecto.Changeset{}} = SurveyResponses.update_survey_response(survey_response, @invalid_attrs)
      assert survey_response == SurveyResponses.get_survey_response!(survey_response.id)
    end

    test "delete_survey_response/1 deletes the survey_response" do
      survey_response = survey_response_fixture()
      assert {:ok, %SurveyResponse{}} = SurveyResponses.delete_survey_response(survey_response)
      assert_raise Ecto.NoResultsError, fn -> SurveyResponses.get_survey_response!(survey_response.id) end
    end

    test "change_survey_response/1 returns a survey_response changeset" do
      survey_response = survey_response_fixture()
      assert %Ecto.Changeset{} = SurveyResponses.change_survey_response(survey_response)
    end
  end
end
