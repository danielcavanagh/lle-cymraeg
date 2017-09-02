defmodule LleCymraeg.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    AccountRole.create_type

    create table(:accounts) do
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :role, :account_role, null: false

      timestamps()
    end

    create unique_index(:accounts, [:email])
  end
end
