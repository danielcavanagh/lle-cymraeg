defmodule LleCymraeg.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :text, :text, null: false
      add :person_id, references(:people, on_delete: :delete_all), null: false
      add :meetup_id, references(:meetups, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:comments, [:person_id])
    create index(:comments, [:meetup_id])
  end
end
