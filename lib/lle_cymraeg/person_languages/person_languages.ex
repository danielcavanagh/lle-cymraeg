defmodule LleCymraeg.PersonLanguages do
  @moduledoc """
  The PersonLanguages context.
  """

  import Ecto.Query, warn: false
  alias LleCymraeg.Repo

  alias LleCymraeg.PersonLanguages.PersonLanguage

  @doc """
  Returns the list of person_languages.

  ## Examples

      iex> list_person_languages()
      [%PersonLanguage{}, ...]

  """
  def list_person_languages do
    Repo.all(PersonLanguage)
  end

  @doc """
  Gets a single person_language.

  Raises `Ecto.NoResultsError` if the Person language does not exist.

  ## Examples

      iex> get_person_language!(123)
      %PersonLanguage{}

      iex> get_person_language!(456)
      ** (Ecto.NoResultsError)

  """
  def get_person_language!(id), do: Repo.get!(PersonLanguage, id)

  @doc """
  Creates a person_language.

  ## Examples

      iex> create_person_language(%{field: value})
      {:ok, %PersonLanguage{}}

      iex> create_person_language(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_person_language(attrs \\ %{}) do
    %PersonLanguage{}
    |> PersonLanguage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a person_language.

  ## Examples

      iex> update_person_language(person_language, %{field: new_value})
      {:ok, %PersonLanguage{}}

      iex> update_person_language(person_language, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_person_language(%PersonLanguage{} = person_language, attrs) do
    person_language
    |> PersonLanguage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PersonLanguage.

  ## Examples

      iex> delete_person_language(person_language)
      {:ok, %PersonLanguage{}}

      iex> delete_person_language(person_language)
      {:error, %Ecto.Changeset{}}

  """
  def delete_person_language(%PersonLanguage{} = person_language) do
    Repo.delete(person_language)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking person_language changes.

  ## Examples

      iex> change_person_language(person_language)
      %Ecto.Changeset{source: %PersonLanguage{}}

  """
  def change_person_language(%PersonLanguage{} = person_language) do
    PersonLanguage.changeset(person_language, %{})
  end
end
