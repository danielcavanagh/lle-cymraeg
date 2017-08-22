defmodule LleCymraeg.People.Person do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.People.Person


  schema "people" do
    field :name, :string, null: false
    field :gender, Gender, null: false
    field :bio, :string, null: false
    field :dob, :date, null: false
    field :is_public?, :boolean, default: false, null: false
    field :travel_time, :integer, null: false

    belongs_to :account, LleCymraeg.Accounts.Account
    belongs_to :ui_language, LleCymraeg.Languages.Language
    has_one :location, LleCymraeg.Locations.Location
    has_many :languages, LleCymraeg.PersonLanguages.PersonLanguage

    has_many :sent_messages, LleCymraeg.Messages.Message, foreign_key: :from_id
    has_many :received_messages, LleCymraeg.Messages.Message, foreign_key: :to_id

    has_many :meetups, LleCymraeg.Meetups.Meetup, foreign_key: :creator_id
    has_many :invitations, LleCymraeg.Invitations.Invitation
    has_many :comments, LleCymraeg.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(%Person{} = person, attrs) do
    person
    |> cast(attrs, [:name, :dob, :bio, :is_public?, :travel_time, :account_id, :ui_language_id])
    |> cast_assoc(:location)
    |> cast_assoc(:languages)
    |> assoc_constraint(:account)
    |> assoc_constraint(:ui_language)
    |> validate_required([:name, :dob, :bio, :is_public?, :travel_time, :account_id])
    |> validate_number(:travel_time, greater_than: 0)
    |> validate_date_in_past(:dob)
  end

  def validate_date_in_past(%{changes: changes}=changeset, field) do
    if changes[field] and Ecto.Date.compare(changes[field], Ecto.Date.utc) != :lt do
      changeset
      |> add_error(field, "must be in the past")
    else
      changeset
    end
  end
end
