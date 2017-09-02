defmodule LleCymraeg.Repo.Migrations.CreateMeetups do
  use Ecto.Migration

  def change do
    create table(:meetups) do
      add :datetime, :naive_datetime, null: false
      add :description, :text
      add :is_private?, :boolean, default: false, null: false
      add :creator_id, references(:people, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:meetups, [:creator_id])
  end
end
