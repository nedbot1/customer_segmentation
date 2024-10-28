defmodule CustomerSegmentation.Dzongkhags do
  @moduledoc """
  The Dzongkhags context.
  """

  import Ecto.Query, warn: false
  alias CustomerSegmentation.Repo

  alias CustomerSegmentation.Dzongkhags.Dzongkhag

  @doc """
  Returns the list of dzongkhags.

  ## Examples

      iex> list_dzongkhags()
      [%Dzongkhag{}, ...]

  """
  def list_dzongkhags do
    Repo.all(Dzongkhag)
  end

  @doc """
  Gets a single dzongkhag.

  Raises `Ecto.NoResultsError` if the Dzongkhag does not exist.

  ## Examples

      iex> get_dzongkhag!(123)
      %Dzongkhag{}

      iex> get_dzongkhag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dzongkhag!(id), do: Repo.get!(Dzongkhag, id)

  @doc """
  Creates a dzongkhag.

  ## Examples

      iex> create_dzongkhag(%{field: value})
      {:ok, %Dzongkhag{}}

      iex> create_dzongkhag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dzongkhag(attrs \\ %{}) do
    %Dzongkhag{}
    |> Dzongkhag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dzongkhag.

  ## Examples

      iex> update_dzongkhag(dzongkhag, %{field: new_value})
      {:ok, %Dzongkhag{}}

      iex> update_dzongkhag(dzongkhag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dzongkhag(%Dzongkhag{} = dzongkhag, attrs) do
    dzongkhag
    |> Dzongkhag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dzongkhag.

  ## Examples

      iex> delete_dzongkhag(dzongkhag)
      {:ok, %Dzongkhag{}}

      iex> delete_dzongkhag(dzongkhag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dzongkhag(%Dzongkhag{} = dzongkhag) do
    Repo.delete(dzongkhag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dzongkhag changes.

  ## Examples

      iex> change_dzongkhag(dzongkhag)
      %Ecto.Changeset{data: %Dzongkhag{}}

  """
  def change_dzongkhag(%Dzongkhag{} = dzongkhag, attrs \\ %{}) do
    Dzongkhag.changeset(dzongkhag, attrs)
  end
end
