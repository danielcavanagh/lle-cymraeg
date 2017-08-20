defmodule LleCymraeg.People.Person do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.People.Person


  schema "people" do
    field :gender, Gender, null: false
    field :bio, :string, null: false
    field :dob, :date, null: false
    field :is_public?, :boolean, default: false, null: false
    field :name, :string, null: false
    field :travel_time, :integer, null: false
    field :account_id, :id, null: false
    field :location_id, :id, null: false
    field :ui_language_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Person{} = person, attrs) do
    person
    |> cast(attrs, [:name, :dob, :bio, :is_public?, :travel_time])
    |> validate_required([:name, :dob, :bio, :is_public?, :travel_time])
  end
end
