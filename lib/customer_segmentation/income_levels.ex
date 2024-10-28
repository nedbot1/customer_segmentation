defmodule CustomerSegmentation.IncomeLevels do
  @moduledoc """
  The IncomeLevels context.
  """

  import Ecto.Query, warn: false
  alias CustomerSegmentation.Repo

  alias CustomerSegmentation.IncomeLevels.IncomeLevel

  @doc """
  Returns the list of income_levels.

  ## Examples

      iex> list_income_levels()
      [%IncomeLevel{}, ...]

  """
  def list_income_levels do
    Repo.all(IncomeLevel)
  end

  @doc """
  Gets a single income_level.

  Raises `Ecto.NoResultsError` if the Income level does not exist.

  ## Examples

      iex> get_income_level!(123)
      %IncomeLevel{}

      iex> get_income_level!(456)
      ** (Ecto.NoResultsError)

  """
  def get_income_level!(id), do: Repo.get!(IncomeLevel, id)

  @doc """
  Creates a income_level.

  ## Examples

      iex> create_income_level(%{field: value})
      {:ok, %IncomeLevel{}}

      iex> create_income_level(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_income_level(attrs \\ %{}) do
    %IncomeLevel{}
    |> IncomeLevel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a income_level.

  ## Examples

      iex> update_income_level(income_level, %{field: new_value})
      {:ok, %IncomeLevel{}}

      iex> update_income_level(income_level, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_income_level(%IncomeLevel{} = income_level, attrs) do
    income_level
    |> IncomeLevel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a income_level.

  ## Examples

      iex> delete_income_level(income_level)
      {:ok, %IncomeLevel{}}

      iex> delete_income_level(income_level)
      {:error, %Ecto.Changeset{}}

  """
  def delete_income_level(%IncomeLevel{} = income_level) do
    Repo.delete(income_level)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking income_level changes.

  ## Examples

      iex> change_income_level(income_level)
      %Ecto.Changeset{data: %IncomeLevel{}}

  """
  def change_income_level(%IncomeLevel{} = income_level, attrs \\ %{}) do
    IncomeLevel.changeset(income_level, attrs)
  end
end
