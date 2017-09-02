defmodule LleCymraeg.Languages.Language do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Languages.Language

  schema "languages" do
    field :name, :string, null: false
    field :iso_code, :string, null: false
    field :ietf_tags, {:array, :string}, null: false

    timestamps()
  end

  @doc false
  def changeset(%Language{} = language, attrs) do
    language
    |> cast(attrs, [:name, :iso_code, :ietf_tags])
    |> validate_required([:name, :iso_code, :ietf_tags])
    |> unique_constraint(:name)
    |> unique_constraint(:code)
  end
end
