defmodule LleCymraeg.PersonLanguages.PersonLanguage do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.PersonLanguages.PersonLanguage


  schema "person_languages" do
    field :proficiency, :string, null: false

    belongs_to :person, LleCymraeg.People.Person
    belongs_to :language, LleCymraeg.Languages.Language

    timestamps()
  end

  @doc false
  def changeset(%PersonLanguage{} = person_language, attrs) do
    person_language
    |> cast(attrs, [:proficiency, :person_id, :language_id])
    |> assoc_constraint(:person)
    |> assoc_constraint(:language)
    |> validate_required([:proficiency, :person_id, :language_id])
  end
end
