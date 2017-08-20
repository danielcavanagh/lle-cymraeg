defmodule LleCymraeg.PersonLanguages.PersonLanguage do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.PersonLanguages.PersonLanguage


  schema "person_languages" do
    field :proficiency, :string, null: false
    field :person_id, :id, null: false
    field :language_id, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(%PersonLanguage{} = person_language, attrs) do
    person_language
    |> cast(attrs, [:proficiency])
    |> validate_required([:proficiency])
  end
end
