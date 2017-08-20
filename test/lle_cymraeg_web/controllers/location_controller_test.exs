defmodule LleCymraegWeb.LocationControllerTest do
  use LleCymraegWeb.ConnCase

  alias LleCymraeg.Locations
  alias LleCymraeg.Locations.Location

  @create_attrs %{address_lines: "some address_lines", admin_area: "some admin_area", country_code: "some country_code", lat_long: "some lat_long", locality: "some locality", name: "some name", postcode: "some postcode"}
  @update_attrs %{address_lines: "some updated address_lines", admin_area: "some updated admin_area", country_code: "some updated country_code", lat_long: "some updated lat_long", locality: "some updated locality", name: "some updated name", postcode: "some updated postcode"}
  @invalid_attrs %{address_lines: nil, admin_area: nil, country_code: nil, lat_long: nil, locality: nil, name: nil, postcode: nil}

  def fixture(:location) do
    {:ok, location} = Locations.create_location(@create_attrs)
    location
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all locations", %{conn: conn} do
      conn = get conn, location_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create location" do
    test "renders location when data is valid", %{conn: conn} do
      conn = post conn, location_path(conn, :create), location: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, location_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address_lines" => "some address_lines",
        "admin_area" => "some admin_area",
        "country_code" => "some country_code",
        "lat_long" => "some lat_long",
        "locality" => "some locality",
        "name" => "some name",
        "postcode" => "some postcode"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, location_path(conn, :create), location: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update location" do
    setup [:create_location]

    test "renders location when data is valid", %{conn: conn, location: %Location{id: id} = location} do
      conn = put conn, location_path(conn, :update, location), location: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, location_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address_lines" => "some updated address_lines",
        "admin_area" => "some updated admin_area",
        "country_code" => "some updated country_code",
        "lat_long" => "some updated lat_long",
        "locality" => "some updated locality",
        "name" => "some updated name",
        "postcode" => "some updated postcode"}
    end

    test "renders errors when data is invalid", %{conn: conn, location: location} do
      conn = put conn, location_path(conn, :update, location), location: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete location" do
    setup [:create_location]

    test "deletes chosen location", %{conn: conn, location: location} do
      conn = delete conn, location_path(conn, :delete, location)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, location_path(conn, :show, location)
      end
    end
  end

  defp create_location(_) do
    location = fixture(:location)
    {:ok, location: location}
  end
end
