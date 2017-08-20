defmodule LleCymraeg.Businesses.Business do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Businesses.Business


  schema "businesses" do
    field :name, :string, null: false
    field :description, :string
    field :type_id, :id
    field :location_id, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(%Business{} = business, attrs) do
    business
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
