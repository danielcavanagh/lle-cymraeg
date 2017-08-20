defmodule LleCymraegWeb.PersonView do
  use LleCymraegWeb, :view
  alias LleCymraegWeb.PersonView

  def render("index.json", %{people: people}) do
    %{data: render_many(people, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      name: person.name,
      dob: person.dob,
      bio: person.bio,
      is_public?: person.is_public?,
      travel_time: person.travel_time}
  end
end
