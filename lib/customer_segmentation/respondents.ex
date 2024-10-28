defmodule CustomerSegmentation.Respondents do
  @moduledoc """
  The Respondents context.
  """

  import Ecto.Query, warn: false
  alias CustomerSegmentation.Repo

  alias CustomerSegmentation.Respondents.Respondent

  @doc """
  Returns the list of respondents.

  ## Examples

      iex> list_respondents()
      [%Respondent{}, ...]

  """
  def list_respondents do
    Repo.all(Respondent)
  end

  @doc """
  Gets a single respondent.

  Raises `Ecto.NoResultsError` if the Respondent does not exist.

  ## Examples

      iex> get_respondent!(123)
      %Respondent{}

      iex> get_respondent!(456)
      ** (Ecto.NoResultsError)

  """
  def get_respondent!(id), do: Repo.get!(Respondent, id)

  @doc """
  Creates a respondent.

  ## Examples

      iex> create_respondent(%{field: value})
      {:ok, %Respondent{}}

      iex> create_respondent(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_respondent(attrs \\ %{}) do
    %Respondent{}
    |> Respondent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a respondent.

  ## Examples

      iex> update_respondent(respondent, %{field: new_value})
      {:ok, %Respondent{}}

      iex> update_respondent(respondent, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_respondent(%Respondent{} = respondent, attrs) do
    respondent
    |> Respondent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a respondent.

  ## Examples

      iex> delete_respondent(respondent)
      {:ok, %Respondent{}}

      iex> delete_respondent(respondent)
      {:error, %Ecto.Changeset{}}

  """
  def delete_respondent(%Respondent{} = respondent) do
    Repo.delete(respondent)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking respondent changes.

  ## Examples

      iex> change_respondent(respondent)
      %Ecto.Changeset{data: %Respondent{}}

  """
  def change_respondent(%Respondent{} = respondent, attrs \\ %{}) do
    Respondent.changeset(respondent, attrs)
  end
end
