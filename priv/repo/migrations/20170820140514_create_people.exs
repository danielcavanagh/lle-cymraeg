defmodule LleCymraeg.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    Gender.create_type

    create table(:people) do
      add :name, :string, null: false
      add :gender, :gender, null: false
      add :dob, :date, null: false
      add :bio, :string
      add :is_public?, :boolean, default: false, null: false
      add :travel_time, :integer, null: false
      add :account_id, references(:accounts, on_delete: :delete_all), null: false
      add :location_id, references(:locations, on_delete: :nothing), null: false
      add :ui_language_id, references(:languages, on_delete: :nilify_all)

      timestamps()
    end

    create index(:people, [:account_id])
    create index(:people, [:location_id])
    create index(:people, [:ui_language_id])
  end
end
