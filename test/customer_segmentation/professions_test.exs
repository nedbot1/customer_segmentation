defmodule CustomerSegmentation.ProfessionsTest do
  use CustomerSegmentation.DataCase

  alias CustomerSegmentation.Professions

  describe "professions" do
    alias CustomerSegmentation.Professions.Profession

    import CustomerSegmentation.ProfessionsFixtures

    @invalid_attrs %{name: nil}

    test "list_professions/0 returns all professions" do
      profession = profession_fixture()
      assert Professions.list_professions() == [profession]
    end

    test "get_profession!/1 returns the profession with given id" do
      profession = profession_fixture()
      assert Professions.get_profession!(profession.id) == profession
    end

    test "create_profession/1 with valid data creates a profession" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Profession{} = profession} = Professions.create_profession(valid_attrs)
      assert profession.name == "some name"
    end

    test "create_profession/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Professions.create_profession(@invalid_attrs)
    end

    test "update_profession/2 with valid data updates the profession" do
      profession = profession_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Profession{} = profession} = Professions.update_profession(profession, update_attrs)
      assert profession.name == "some updated name"
    end

    test "update_profession/2 with invalid data returns error changeset" do
      profession = profession_fixture()
      assert {:error, %Ecto.Changeset{}} = Professions.update_profession(profession, @invalid_attrs)
      assert profession == Professions.get_profession!(profession.id)
    end

    test "delete_profession/1 deletes the profession" do
      profession = profession_fixture()
      assert {:ok, %Profession{}} = Professions.delete_profession(profession)
      assert_raise Ecto.NoResultsError, fn -> Professions.get_profession!(profession.id) end
    end

    test "change_profession/1 returns a profession changeset" do
      profession = profession_fixture()
      assert %Ecto.Changeset{} = Professions.change_profession(profession)
    end
  end
end
