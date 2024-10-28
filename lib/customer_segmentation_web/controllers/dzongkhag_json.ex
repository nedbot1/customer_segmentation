defmodule CustomerSegmentationWeb.DzongkhagJSON do
  alias CustomerSegmentation.Dzongkhags.Dzongkhag

  @doc """
  Renders a list of dzongkhags.
  """
  def index(%{dzongkhags: dzongkhags}) do
    %{data: for(dzongkhag <- dzongkhags, do: data(dzongkhag))}
  end

  @doc """
  Renders a single dzongkhag.
  """
  def show(%{dzongkhag: dzongkhag}) do
    %{data: data(dzongkhag)}
  end

  defp data(%Dzongkhag{} = dzongkhag) do
    %{
      id: dzongkhag.id,
      name: dzongkhag.name
    }
  end
end
