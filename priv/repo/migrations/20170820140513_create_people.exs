defmodule LleCymraeg.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    Gender.create_type

    create table(:people) do
      add :name, :string, null: false
      add :gender, :gender, null: false
      add :bio, :string, null: false
      add :dob, :date, null: false
      add :is_public?, :boolean, default: false, null: false
      add :travel_time, :integer, null: false
      add :ui_language_tag, :string
      add :account_id, references(:accounts, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:people, [:account_id])
  end
end
