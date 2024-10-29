defmodule CustomerSegmentation.Respondents do
  @moduledoc """
  The Respondents context.
  """

  import Ecto.Query, warn: false
  alias CustomerSegmentation.Repo

  alias CustomerSegmentation.Respondents.Respondent
  alias CustomerSegmentation.Professions.Profession
  alias CustomerSegmentation.IncomeLevels.IncomeLevel
  alias CustomerSegmentation.Dzongkhags.Dzongkhag
  alias Ecto.Multi


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

  def create_complete_respondent(attrs) do
    Multi.new()
    |> Multi.insert(:profession, Profession.changeset(%Profession{}, attrs["profession"]))
    |> Multi.insert(:income_level, IncomeLevel.changeset(%IncomeLevel{}, attrs["income_level"]))
    |> Multi.insert(:dzongkhag, Dzongkhag.changeset(%Dzongkhag{}, attrs["dzongkhag"]))
    |> Multi.run(:respondent, fn repo, %{profession: profession, income_level: income, dzongkhag: dzongkhag} ->
      respondent_attrs = %{
        "gender" => attrs["gender"],
        "age" => attrs["age"],
        "profession_id" => profession.id,
        "income_level_id" => income.id,
        "dzongkhag_id" => dzongkhag.id
      }

      Respondent.changeset(%Respondent{}, respondent_attrs)
      |> repo.insert()
    end)
    |> Repo.transaction()
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
