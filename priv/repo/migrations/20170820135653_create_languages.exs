defmodule LleCymraeg.Repo.Migrations.CreateLanguages do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add :name, :string, null: false
      add :iso_code, :string, null: false
      add :ietf_tags, {:array, :string}, null: false

      timestamps()
    end

    create unique_index(:languages, [:name])
    create unique_index(:languages, [:iso_code])
  end
end
