defmodule CustomerSegmentationWeb.IncomeLevelJSON do
  alias CustomerSegmentation.IncomeLevels.IncomeLevel

  @doc """
  Renders a list of income_levels.
  """
  def index(%{income_levels: income_levels}) do
    %{data: for(income_level <- income_levels, do: data(income_level))}
  end

  @doc """
  Renders a single income_level.
  """
  def show(%{income_level: income_level}) do
    %{data: data(income_level)}
  end

  defp data(%IncomeLevel{} = income_level) do
    %{
      id: income_level.id,
      low: income_level.low,
      high: income_level.high
    }
  end
end
