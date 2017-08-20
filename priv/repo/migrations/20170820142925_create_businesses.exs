defmodule LleCymraeg.Repo.Migrations.CreateBusinesses do
  use Ecto.Migration

  def change do
    create table(:businesses) do
      add :name, :string, null: false
      add :description, :text
      add :type_id, references(:business_types, on_delete: :nilify_all)
      add :location_id, references(:locations, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:businesses, [:type_id])
    create index(:businesses, [:location_id])
  end
end
