defmodule LleCymraeg.Invitations.Invitation do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Invitations.Invitation


  schema "invitations" do
    field :status, InvitationStatus, null: false
    field :type, InvitationType, null: false

    belongs_to :meetup, LleCymraeg.Meetups.Meetup
    belongs_to :person, LleCymraeg.People.Person

    timestamps()
  end

  @doc false
  def changeset(%Invitation{} = invitation, attrs) do
    invitation
    |> cast(attrs, [:type, :status, :meetup_id, :person_id])
    |> assoc_constraint(:meetup)
    |> assoc_constraint(:person)
    |> validate_required([:type, :status, :meetup_id, :person_id])
  end
end
