defmodule LleCymraeg.BusinessLanguages do
  @moduledoc """
  The BusinessLanguages context.
  """

  import Ecto.Query, warn: false
  alias LleCymraeg.Repo

  alias LleCymraeg.BusinessLanguages.BusinessLanguage

  @doc """
  Returns the list of business_languages.

  ## Examples

      iex> list_business_languages()
      [%BusinessLanguage{}, ...]

  """
  def list_business_languages do
    Repo.all(BusinessLanguage)
  end

  @doc """
  Gets a single business_language.

  Raises `Ecto.NoResultsError` if the Business language does not exist.

  ## Examples

      iex> get_business_language!(123)
      %BusinessLanguage{}

      iex> get_business_language!(456)
      ** (Ecto.NoResultsError)

  """
  def get_business_language!(id), do: Repo.get!(BusinessLanguage, id)

  @doc """
  Creates a business_language.

  ## Examples

      iex> create_business_language(%{field: value})
      {:ok, %BusinessLanguage{}}

      iex> create_business_language(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_business_language(attrs \\ %{}) do
    %BusinessLanguage{}
    |> BusinessLanguage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a business_language.

  ## Examples

      iex> update_business_language(business_language, %{field: new_value})
      {:ok, %BusinessLanguage{}}

      iex> update_business_language(business_language, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_business_language(%BusinessLanguage{} = business_language, attrs) do
    business_language
    |> BusinessLanguage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BusinessLanguage.

  ## Examples

      iex> delete_business_language(business_language)
      {:ok, %BusinessLanguage{}}

      iex> delete_business_language(business_language)
      {:error, %Ecto.Changeset{}}

  """
  def delete_business_language(%BusinessLanguage{} = business_language) do
    Repo.delete(business_language)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking business_language changes.

  ## Examples

      iex> change_business_language(business_language)
      %Ecto.Changeset{source: %BusinessLanguage{}}

  """
  def change_business_language(%BusinessLanguage{} = business_language) do
    BusinessLanguage.changeset(business_language, %{})
  end
end
