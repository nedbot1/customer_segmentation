defmodule CustomerSegmentation.RespondentsTest do
  use CustomerSegmentation.DataCase

  alias CustomerSegmentation.Respondents

  describe "respondents" do
    alias CustomerSegmentation.Respondents.Respondent

    import CustomerSegmentation.RespondentsFixtures

    @invalid_attrs %{gender: nil, age: nil}

    test "list_respondents/0 returns all respondents" do
      respondent = respondent_fixture()
      assert Respondents.list_respondents() == [respondent]
    end

    test "get_respondent!/1 returns the respondent with given id" do
      respondent = respondent_fixture()
      assert Respondents.get_respondent!(respondent.id) == respondent
    end

    test "create_respondent/1 with valid data creates a respondent" do
      valid_attrs = %{gender: "some gender", age: 42}

      assert {:ok, %Respondent{} = respondent} = Respondents.create_respondent(valid_attrs)
      assert respondent.gender == "some gender"
      assert respondent.age == 42
    end

    test "create_respondent/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Respondents.create_respondent(@invalid_attrs)
    end

    test "update_respondent/2 with valid data updates the respondent" do
      respondent = respondent_fixture()
      update_attrs = %{gender: "some updated gender", age: 43}

      assert {:ok, %Respondent{} = respondent} = Respondents.update_respondent(respondent, update_attrs)
      assert respondent.gender == "some updated gender"
      assert respondent.age == 43
    end

    test "update_respondent/2 with invalid data returns error changeset" do
      respondent = respondent_fixture()
      assert {:error, %Ecto.Changeset{}} = Respondents.update_respondent(respondent, @invalid_attrs)
      assert respondent == Respondents.get_respondent!(respondent.id)
    end

    test "delete_respondent/1 deletes the respondent" do
      respondent = respondent_fixture()
      assert {:ok, %Respondent{}} = Respondents.delete_respondent(respondent)
      assert_raise Ecto.NoResultsError, fn -> Respondents.get_respondent!(respondent.id) end
    end

    test "change_respondent/1 returns a respondent changeset" do
      respondent = respondent_fixture()
      assert %Ecto.Changeset{} = Respondents.change_respondent(respondent)
    end
  end
end
