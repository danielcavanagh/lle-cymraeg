defmodule LleCymraeg.LocationsTest do
  use LleCymraeg.DataCase

  alias LleCymraeg.Locations

  describe "locations" do
    alias LleCymraeg.Locations.Location

    @valid_attrs %{"address-lines": "some address-lines", "admin-area": "some admin-area", "country-code": "some country-code", "lat-long": "some lat-long", locality: "some locality", name: "some name", postcode: "some postcode"}
    @update_attrs %{"address-lines": "some updated address-lines", "admin-area": "some updated admin-area", "country-code": "some updated country-code", "lat-long": "some updated lat-long", locality: "some updated locality", name: "some updated name", postcode: "some updated postcode"}
    @invalid_attrs %{"address-lines": nil, "admin-area": nil, "country-code": nil, "lat-long": nil, locality: nil, name: nil, postcode: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Locations.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Locations.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Locations.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Locations.create_location(@valid_attrs)
      assert location.address-lines == "some address-lines"
      assert location.admin-area == "some admin-area"
      assert location.country-code == "some country-code"
      assert location.lat-long == "some lat-long"
      assert location.locality == "some locality"
      assert location.name == "some name"
      assert location.postcode == "some postcode"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, location} = Locations.update_location(location, @update_attrs)
      assert %Location{} = location
      assert location.address-lines == "some updated address-lines"
      assert location.admin-area == "some updated admin-area"
      assert location.country-code == "some updated country-code"
      assert location.lat-long == "some updated lat-long"
      assert location.locality == "some updated locality"
      assert location.name == "some updated name"
      assert location.postcode == "some updated postcode"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_location(location, @invalid_attrs)
      assert location == Locations.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Locations.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Locations.change_location(location)
    end
  end

  describe "locations" do
    alias LleCymraeg.Locations.Location

    @valid_attrs %{address_lines: "some address_lines", admin_area: "some admin_area", country_code: "some country_code", lat_long: "some lat_long", locality: "some locality", name: "some name", postcode: "some postcode"}
    @update_attrs %{address_lines: "some updated address_lines", admin_area: "some updated admin_area", country_code: "some updated country_code", lat_long: "some updated lat_long", locality: "some updated locality", name: "some updated name", postcode: "some updated postcode"}
    @invalid_attrs %{address_lines: nil, admin_area: nil, country_code: nil, lat_long: nil, locality: nil, name: nil, postcode: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Locations.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Locations.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Locations.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Locations.create_location(@valid_attrs)
      assert location.address_lines == "some address_lines"
      assert location.admin_area == "some admin_area"
      assert location.country_code == "some country_code"
      assert location.lat_long == "some lat_long"
      assert location.locality == "some locality"
      assert location.name == "some name"
      assert location.postcode == "some postcode"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, location} = Locations.update_location(location, @update_attrs)
      assert %Location{} = location
      assert location.address_lines == "some updated address_lines"
      assert location.admin_area == "some updated admin_area"
      assert location.country_code == "some updated country_code"
      assert location.lat_long == "some updated lat_long"
      assert location.locality == "some updated locality"
      assert location.name == "some updated name"
      assert location.postcode == "some updated postcode"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_location(location, @invalid_attrs)
      assert location == Locations.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Locations.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Locations.change_location(location)
    end
  end
end
