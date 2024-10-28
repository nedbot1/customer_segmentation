defmodule CustomerSegmentation.IncomeLevelsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CustomerSegmentation.IncomeLevels` context.
  """

  @doc """
  Generate a income_level.
  """
  def income_level_fixture(attrs \\ %{}) do
    {:ok, income_level} =
      attrs
      |> Enum.into(%{
        high: 42,
        low: 42
      })
      |> CustomerSegmentation.IncomeLevels.create_income_level()

    income_level
  end
end
