defmodule LleCymraeg.Invitations.Invitation do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Invitations.Invitation


  schema "invitations" do
    field :status, InvitationStatus, null: false
    field :type, InvitationType, null: false
    field :meetup_id, :id, null: false
    field :person_id, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(%Invitation{} = invitation, attrs) do
    invitation
    |> cast(attrs, [:type, :status])
    |> validate_required([:type, :status])
  end
end
