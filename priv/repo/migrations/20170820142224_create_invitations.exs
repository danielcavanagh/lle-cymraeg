defmodule LleCymraeg.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    InvitationType.create_type
    InvitationStatus.create_type

    create table(:invitations) do
      add :type, :invitation_type, null: false
      add :status, :invitation_status, null: false
      add :meetup_id, references(:meetups, on_delete: :delete_all), null: false
      add :person_id, references(:people, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:invitations, [:meetup_id])
    create index(:invitations, [:person_id])
  end
end
