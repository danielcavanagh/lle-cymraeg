defmodule LleCymraeg.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Messages.Message


  schema "messages" do
    field :is_read?, :boolean, default: false, null: false
    field :text, :string, null: false

    belongs_to :from, LleCymraeg.People.Person
    belongs_to :to, LleCymraeg.People.Person

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:text, :is_read?, :from_id, :to_id])
    |> assoc_constraint(:from)
    |> assoc_constraint(:to)
    |> validate_required([:text, :is_read?, :from_id, :to_id])
  end
end
