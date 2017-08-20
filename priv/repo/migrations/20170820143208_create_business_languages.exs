defmodule LleCymraeg.Repo.Migrations.CreateBusinessLanguages do
  use Ecto.Migration

  def change do
    LanguageFrequency.create_type

    create table(:business_languages) do
      add :proficiency, :language_proficiency, null: false
      add :frequency, :language_frequency, null: false
      add :business_id, references(:businesses, on_delete: :delete_all), null: false
      add :language_id, references(:languages, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:business_languages, [:business_id])
    create index(:business_languages, [:language_id])
  end
end
