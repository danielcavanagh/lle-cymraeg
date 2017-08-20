defmodule LleCymraegWeb.LocationView do
  use LleCymraegWeb, :view
  alias LleCymraegWeb.LocationView

  def render("index.json", %{locations: locations}) do
    %{data: render_many(locations, LocationView, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{data: render_one(location, LocationView, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{id: location.id,
      name: location.name,
      lat_long: location.lat_long,
      country_code: location.country_code,
      admin_area: location.admin_area,
      locality: location.locality,
      address_lines: location.address_lines,
      postcode: location.postcode}
  end
end
