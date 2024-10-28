defmodule CustomerSegmentation.SurveyQuestions do
  @moduledoc """
  The SurveyQuestions context.
  """

  import Ecto.Query, warn: false
  alias CustomerSegmentation.Repo

  alias CustomerSegmentation.SurveyQuestions.SurveyQuestion

  @doc """
  Returns the list of survey_questions.

  ## Examples

      iex> list_survey_questions()
      [%SurveyQuestion{}, ...]

  """
  def list_survey_questions do
    Repo.all(SurveyQuestion)
  end

  @doc """
  Gets a single survey_question.

  Raises `Ecto.NoResultsError` if the Survey question does not exist.

  ## Examples

      iex> get_survey_question!(123)
      %SurveyQuestion{}

      iex> get_survey_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_survey_question!(id), do: Repo.get!(SurveyQuestion, id)

  @doc """
  Creates a survey_question.

  ## Examples

      iex> create_survey_question(%{field: value})
      {:ok, %SurveyQuestion{}}

      iex> create_survey_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_survey_question(attrs \\ %{}) do
    %SurveyQuestion{}
    |> SurveyQuestion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a survey_question.

  ## Examples

      iex> update_survey_question(survey_question, %{field: new_value})
      {:ok, %SurveyQuestion{}}

      iex> update_survey_question(survey_question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_survey_question(%SurveyQuestion{} = survey_question, attrs) do
    survey_question
    |> SurveyQuestion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a survey_question.

  ## Examples

      iex> delete_survey_question(survey_question)
      {:ok, %SurveyQuestion{}}

      iex> delete_survey_question(survey_question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_survey_question(%SurveyQuestion{} = survey_question) do
    Repo.delete(survey_question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking survey_question changes.

  ## Examples

      iex> change_survey_question(survey_question)
      %Ecto.Changeset{data: %SurveyQuestion{}}

  """
  def change_survey_question(%SurveyQuestion{} = survey_question, attrs \\ %{}) do
    SurveyQuestion.changeset(survey_question, attrs)
  end
end
