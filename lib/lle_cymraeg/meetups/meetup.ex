defmodule LleCymraeg.Meetups.Meetup do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Meetups.Meetup


  schema "meetups" do
    field :datetime, :naive_datetime, null: false
    field :description, :string
    field :is_private?, :boolean, default: false, null: false
    field :location_id, :id, null: false
    field :creator_id, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(%Meetup{} = meetup, attrs) do
    meetup
    |> cast(attrs, [:datetime, :description, :is_private?])
    |> validate_required([:datetime, :description, :is_private?])
  end
end
