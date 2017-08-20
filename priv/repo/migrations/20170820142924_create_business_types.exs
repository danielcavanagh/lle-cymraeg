defmodule LleCymraeg.Repo.Migrations.CreateBusinessTypes do
  use Ecto.Migration

  def change do
    create table(:business_types) do
      add :name, :string, null: false
      add :parent_id, references(:business_types, on_delete: :delete_all)

      timestamps()
    end

    create index(:business_types, [:parent_id])
  end
end
