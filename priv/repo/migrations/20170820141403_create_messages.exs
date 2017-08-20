defmodule LleCymraeg.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :text, :text, null: false
      add :is_read?, :boolean, default: false, null: false
      add :from_id, references(:people, on_delete: :delete_all), null: false
      add :to_id, references(:people, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:messages, [:from_id])
    create index(:messages, [:to_id])
  end
end
