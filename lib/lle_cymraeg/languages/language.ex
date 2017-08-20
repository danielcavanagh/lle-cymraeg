defmodule LleCymraeg.Languages.Language do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Languages.Language


  schema "languages" do
    field :code, :string, null: false
    field :name, :string, null: false

    timestamps()
  end

  @doc false
  def changeset(%Language{} = language, attrs) do
    language
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
    |> unique_constraint(:name)
    |> unique_constraint(:code)
  end
end
