defmodule LleCymraeg.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Messages.Message


  schema "messages" do
    field :is_read?, :boolean, default: false, null: false
    field :text, :string, null: false
    field :from_id, :id, null: false
    field :to_id, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:text, :is_read?])
    |> validate_required([:text, :is_read?])
  end
end
