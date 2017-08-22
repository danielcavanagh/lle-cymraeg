defmodule LleCymraeg.BusinessLanguages.BusinessLanguage do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.BusinessLanguages.BusinessLanguage


  schema "business_languages" do
    field :frequency, LanguageFrequency, null: false
    field :proficiency, LanguageProficiency, null: false

    belongs_to :business, LleCymraeg.Businesses.Business
    belongs_to :language, LleCymraeg.Languages.Language

    timestamps()
  end

  @doc false
  def changeset(%BusinessLanguage{} = business_language, attrs) do
    business_language
    |> cast(attrs, [:proficiency, :frequency, :business_id, :language_id])
    |> assoc_constraint(:business)
    |> assoc_constraint(:language)
    |> validate_required([:proficiency, :frequency, :business_id, :language_id])
  end
end
