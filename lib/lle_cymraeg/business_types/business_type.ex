defmodule LleCymraeg.BusinessTypes.BusinessType do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.BusinessTypes.BusinessType


  schema "business_types" do
    field :name, :string, null: false

    belongs_to :parent, BusinessType
    has_many :children, BusinessType

    timestamps()
  end

  @doc false
  def changeset(%BusinessType{} = business_type, attrs) do
    business_type
    |> cast(attrs, [:name, :parent_id])
    |> assoc_constraint(:parent)
    |> validate_required([:name])
  end
end
