defmodule LleCymraeg.BusinessTypes do
  @moduledoc """
  The BusinessTypes context.
  """

  import Ecto.Query, warn: false
  alias LleCymraeg.Repo

  alias LleCymraeg.BusinessTypes.BusinessType

  @doc """
  Returns the list of business_types.

  ## Examples

      iex> list_business_types()
      [%BusinessType{}, ...]

  """
  def list_business_types do
    Repo.all(BusinessType)
  end

  @doc """
  Gets a single business_type.

  Raises `Ecto.NoResultsError` if the Business type does not exist.

  ## Examples

      iex> get_business_type!(123)
      %BusinessType{}

      iex> get_business_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_business_type!(id), do: Repo.get!(BusinessType, id)

  @doc """
  Creates a business_type.

  ## Examples

      iex> create_business_type(%{field: value})
      {:ok, %BusinessType{}}

      iex> create_business_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_business_type(attrs \\ %{}) do
    %BusinessType{}
    |> BusinessType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a business_type.

  ## Examples

      iex> update_business_type(business_type, %{field: new_value})
      {:ok, %BusinessType{}}

      iex> update_business_type(business_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_business_type(%BusinessType{} = business_type, attrs) do
    business_type
    |> BusinessType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BusinessType.

  ## Examples

      iex> delete_business_type(business_type)
      {:ok, %BusinessType{}}

      iex> delete_business_type(business_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_business_type(%BusinessType{} = business_type) do
    Repo.delete(business_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking business_type changes.

  ## Examples

      iex> change_business_type(business_type)
      %Ecto.Changeset{source: %BusinessType{}}

  """
  def change_business_type(%BusinessType{} = business_type) do
    BusinessType.changeset(business_type, %{})
  end
end
