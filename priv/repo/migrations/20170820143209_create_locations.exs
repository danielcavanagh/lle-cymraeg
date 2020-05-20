defmodule LleCymraeg.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :address, :string, null: false
      add :admin_area, :string, null: false
      add :country_code, :string, null: false
      add :lat_long, :string, null: false
      add :locality, :string, null: false
      add :postcode, :string
      add :name, :string
      add :person_id, references(:people, on_delete: :delete_all)
      add :meetup_id, references(:meetups, on_delete: :delete_all)
      add :business_id, references(:businesses, on_delete: :delete_all)

      timestamps()
    end

    create index(:locations, [:person_id])
    create index(:locations, [:meetup_id])
    create index(:locations, [:business_id])
  end
end
