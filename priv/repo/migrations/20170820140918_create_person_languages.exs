defmodule LleCymraeg.Repo.Migrations.CreatePersonLanguages do
  use Ecto.Migration

  def change do
    LanguageProficiency.create_type

    create table(:person_languages) do
      add :proficiency, :language_proficiency, null: false
      add :person_id, references(:people, on_delete: :delete_all), null: false
      add :language_id, references(:languages, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:person_languages, [:person_id])
    create index(:person_languages, [:language_id])
  end
end
