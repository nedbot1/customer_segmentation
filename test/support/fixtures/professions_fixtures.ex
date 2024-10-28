defmodule CustomerSegmentation.ProfessionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CustomerSegmentation.Professions` context.
  """

  @doc """
  Generate a profession.
  """
  def profession_fixture(attrs \\ %{}) do
    {:ok, profession} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> CustomerSegmentation.Professions.create_profession()

    profession
  end
end
