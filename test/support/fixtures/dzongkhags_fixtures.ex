defmodule CustomerSegmentation.DzongkhagsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CustomerSegmentation.Dzongkhags` context.
  """

  @doc """
  Generate a dzongkhag.
  """
  def dzongkhag_fixture(attrs \\ %{}) do
    {:ok, dzongkhag} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> CustomerSegmentation.Dzongkhags.create_dzongkhag()

    dzongkhag
  end
end
