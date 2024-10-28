defmodule CustomerSegmentation.RespondentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CustomerSegmentation.Respondents` context.
  """

  @doc """
  Generate a respondent.
  """
  def respondent_fixture(attrs \\ %{}) do
    {:ok, respondent} =
      attrs
      |> Enum.into(%{
        age: 42,
        gender: "some gender"
      })
      |> CustomerSegmentation.Respondents.create_respondent()

    respondent
  end
end
