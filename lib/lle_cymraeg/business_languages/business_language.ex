defmodule LleCymraeg.BusinessLanguages.BusinessLanguage do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.BusinessLanguages.BusinessLanguage


  schema "business_languages" do
    field :frequency, LanguageFrequency, null: false
    field :proficiency, LanguageProficiency, null: false
    field :business_id, :id, null: false
    field :language_id, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(%BusinessLanguage{} = business_language, attrs) do
    business_language
    |> cast(attrs, [:proficiency, :frequency])
    |> validate_required([:proficiency, :frequency])
  end
end
