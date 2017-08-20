defmodule LleCymraeg.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Locations.Location


  schema "locations" do
    field :address_lines, :string, null: false
    field :admin_area, :string, null: false
    field :country_code, :string, null: false
    field :lat_long, :string, null: false
    field :locality, :string, null: false
    field :name, :string
    field :postcode, :string

    timestamps()
  end

  @doc false
  def changeset(%Location{} = location, attrs) do
    location
    |> cast(attrs, [:name, :lat_long, :country_code, :admin_area, :locality, :address_lines, :postcode])
    |> validate_required([:name, :lat_long, :country_code, :admin_area, :locality, :address_lines, :postcode])
  end
end
