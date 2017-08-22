defmodule LleCymraeg.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Comments.Comment


  schema "comments" do
    field :text, :string, null: false

    belongs_to :person, LleCymraeg.People.Person
    belongs_to :meetup, LleCymraeg.Meetups.Meetup

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:text, :person_id, :meetup_id])
    |> assoc_constraint(:person)
    |> assoc_constraint(:meetup)
    |> validate_required([:text, :person_id, :meetup_id])
  end
end
