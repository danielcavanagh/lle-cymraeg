defmodule LleCymraeg.Repo.Migrations.CreateBusinesses do
  use Ecto.Migration

  def change do
    create table(:businesses) do
      add :name, :string, null: false
      add :description, :text
      add :type_id, references(:business_types, on_delete: :nilify_all)

      timestamps()
    end

    create index(:businesses, [:type_id])
  end
end
