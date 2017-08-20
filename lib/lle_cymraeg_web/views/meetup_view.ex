defmodule LleCymraegWeb.MeetupView do
  use LleCymraegWeb, :view
  alias LleCymraegWeb.MeetupView

  def render("index.json", %{meetups: meetups}) do
    %{data: render_many(meetups, MeetupView, "meetup.json")}
  end

  def render("show.json", %{meetup: meetup}) do
    %{data: render_one(meetup, MeetupView, "meetup.json")}
  end

  def render("meetup.json", %{meetup: meetup}) do
    %{id: meetup.id,
      datetime: meetup.datetime,
      description: meetup.description,
      is_private?: meetup.is_private?}
  end
end
