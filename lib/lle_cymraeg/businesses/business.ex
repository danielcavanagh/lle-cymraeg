defmodule LleCymraeg.Businesses.Business do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Businesses.Business


  schema "businesses" do
    field :name, :string, null: false
    field :description, :string

    belongs_to :type, LleCymraeg.BusinessTypes.BusinessType
    has_one :location, LleCymraeg.Locations.Location
    has_many :languages, LleCymraeg.BusinessLanguages.BusinessLanguage

    timestamps()
  end

  @doc false
  def changeset(%Business{} = business, attrs) do
    business
    |> cast(attrs, [:name, :description, :type_id])
    |> cast_assoc(:location)
    |> cast_assoc(:languages)
    |> assoc_constraint(:type)
    |> validate_required([:name, :type_id])
  end
end
