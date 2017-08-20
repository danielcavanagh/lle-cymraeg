defmodule LleCymraeg.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Comments.Comment


  schema "comments" do
    field :text, :string, null: false
    field :person_id, :id, null: false
    field :meetup_id, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
