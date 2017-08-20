defmodule LleCymraeg.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :lat_long, :string, null: false
      add :country_code, :string, null: false
      add :admin_area, :string, null: false
      add :locality, :string, null: false
      add :address_lines, :string, null: false
      add :postcode, :string

      timestamps()
    end

  end
end
