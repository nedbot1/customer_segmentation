defmodule CustomerSegmentation.IncomeLevelsTest do
  use CustomerSegmentation.DataCase

  alias CustomerSegmentation.IncomeLevels

  describe "income_levels" do
    alias CustomerSegmentation.IncomeLevels.IncomeLevel

    import CustomerSegmentation.IncomeLevelsFixtures

    @invalid_attrs %{high: nil, low: nil}

    test "list_income_levels/0 returns all income_levels" do
      income_level = income_level_fixture()
      assert IncomeLevels.list_income_levels() == [income_level]
    end

    test "get_income_level!/1 returns the income_level with given id" do
      income_level = income_level_fixture()
      assert IncomeLevels.get_income_level!(income_level.id) == income_level
    end

    test "create_income_level/1 with valid data creates a income_level" do
      valid_attrs = %{high: 42, low: 42}

      assert {:ok, %IncomeLevel{} = income_level} = IncomeLevels.create_income_level(valid_attrs)
      assert income_level.high == 42
      assert income_level.low == 42
    end

    test "create_income_level/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IncomeLevels.create_income_level(@invalid_attrs)
    end

    test "update_income_level/2 with valid data updates the income_level" do
      income_level = income_level_fixture()
      update_attrs = %{high: 43, low: 43}

      assert {:ok, %IncomeLevel{} = income_level} = IncomeLevels.update_income_level(income_level, update_attrs)
      assert income_level.high == 43
      assert income_level.low == 43
    end

    test "update_income_level/2 with invalid data returns error changeset" do
      income_level = income_level_fixture()
      assert {:error, %Ecto.Changeset{}} = IncomeLevels.update_income_level(income_level, @invalid_attrs)
      assert income_level == IncomeLevels.get_income_level!(income_level.id)
    end

    test "delete_income_level/1 deletes the income_level" do
      income_level = income_level_fixture()
      assert {:ok, %IncomeLevel{}} = IncomeLevels.delete_income_level(income_level)
      assert_raise Ecto.NoResultsError, fn -> IncomeLevels.get_income_level!(income_level.id) end
    end

    test "change_income_level/1 returns a income_level changeset" do
      income_level = income_level_fixture()
      assert %Ecto.Changeset{} = IncomeLevels.change_income_level(income_level)
    end
  end
end
