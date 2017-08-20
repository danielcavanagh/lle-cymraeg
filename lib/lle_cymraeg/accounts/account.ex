defmodule LleCymraeg.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset
  alias LleCymraeg.Accounts.Account


  schema "accounts" do
    field :email, :string, null: false
    field :password_hash, :string, null: false
    field :role, AccountRole, null: false

    timestamps()
  end

  @doc false
  def changeset(%Account{} = account, attrs) do
    account
    |> cast(attrs, [:role, :email, :password_hash])
    |> validate_required([:role, :email, :password_hash])
    |> unique_constraint(:email)
  end
end
