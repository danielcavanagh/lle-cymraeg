defmodule LleCymraeg.Repo.Migrations.CreateLanguages do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add :name, :string, null: false
      add :code, :string, null: false

      timestamps()
    end

    create unique_index(:languages, [:name])
    create unique_index(:languages, [:code])
  end
end
