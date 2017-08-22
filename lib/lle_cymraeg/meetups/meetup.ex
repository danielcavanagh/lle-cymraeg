defmodule LleCymraeg.Meetups.Meetup do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Meetups.Meetup


  schema "meetups" do
    field :datetime, :naive_datetime, null: false
    field :description, :string
    field :is_private?, :boolean, default: false, null: false

    has_one :location, LleCymraeg.Locations.Location
    belongs_to :creator, LleCymraeg.People.Person

    has_many :invitations, LleCymraeg.Invitations.Invitation
    has_many :comments, LleCymraeg.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(%Meetup{} = meetup, attrs) do
    meetup
    |> cast(attrs, [:datetime, :description, :is_private?, :creator_id])
    |> cast_assoc(:location)
    |> assoc_constraint(:creator)
    |> validate_required([:datetime, :description, :is_private?, :creator_id])
  end
end
