defmodule LleCymraeg.BusinessTypes.BusinessType do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.BusinessTypes.BusinessType


  schema "business_types" do
    field :name, :string, null: false
    field :parent_id, :id

    timestamps()
  end

  @doc false
  def changeset(%BusinessType{} = business_type, attrs) do
    business_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
