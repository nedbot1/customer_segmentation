defmodule CustomerSegmentation.DzongkhagsTest do
  use CustomerSegmentation.DataCase

  alias CustomerSegmentation.Dzongkhags

  describe "dzongkhags" do
    alias CustomerSegmentation.Dzongkhags.Dzongkhag

    import CustomerSegmentation.DzongkhagsFixtures

    @invalid_attrs %{name: nil}

    test "list_dzongkhags/0 returns all dzongkhags" do
      dzongkhag = dzongkhag_fixture()
      assert Dzongkhags.list_dzongkhags() == [dzongkhag]
    end

    test "get_dzongkhag!/1 returns the dzongkhag with given id" do
      dzongkhag = dzongkhag_fixture()
      assert Dzongkhags.get_dzongkhag!(dzongkhag.id) == dzongkhag
    end

    test "create_dzongkhag/1 with valid data creates a dzongkhag" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Dzongkhag{} = dzongkhag} = Dzongkhags.create_dzongkhag(valid_attrs)
      assert dzongkhag.name == "some name"
    end

    test "create_dzongkhag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dzongkhags.create_dzongkhag(@invalid_attrs)
    end

    test "update_dzongkhag/2 with valid data updates the dzongkhag" do
      dzongkhag = dzongkhag_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Dzongkhag{} = dzongkhag} = Dzongkhags.update_dzongkhag(dzongkhag, update_attrs)
      assert dzongkhag.name == "some updated name"
    end

    test "update_dzongkhag/2 with invalid data returns error changeset" do
      dzongkhag = dzongkhag_fixture()
      assert {:error, %Ecto.Changeset{}} = Dzongkhags.update_dzongkhag(dzongkhag, @invalid_attrs)
      assert dzongkhag == Dzongkhags.get_dzongkhag!(dzongkhag.id)
    end

    test "delete_dzongkhag/1 deletes the dzongkhag" do
      dzongkhag = dzongkhag_fixture()
      assert {:ok, %Dzongkhag{}} = Dzongkhags.delete_dzongkhag(dzongkhag)
      assert_raise Ecto.NoResultsError, fn -> Dzongkhags.get_dzongkhag!(dzongkhag.id) end
    end

    test "change_dzongkhag/1 returns a dzongkhag changeset" do
      dzongkhag = dzongkhag_fixture()
      assert %Ecto.Changeset{} = Dzongkhags.change_dzongkhag(dzongkhag)
    end
  end
end
