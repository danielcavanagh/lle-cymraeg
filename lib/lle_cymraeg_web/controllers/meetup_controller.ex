defmodule LleCymraegWeb.MeetupController do
  use LleCymraegWeb, :controller

  alias LleCymraeg.Meetups
  alias LleCymraeg.Meetups.Meetup

  action_fallback LleCymraegWeb.FallbackController

  def index(conn, _params) do
    meetups = Meetups.list_meetups()
    render(conn, "index.json", meetups: meetups)
  end

  def create(conn, %{"meetup" => meetup_params}) do
    with {:ok, %Meetup{} = meetup} <- Meetups.create_meetup(meetup_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", meetup_path(conn, :show, meetup))
      |> render("show.json", meetup: meetup)
    end
  end

  def show(conn, %{"id" => id}) do
    meetup = Meetups.get_meetup!(id)
    render(conn, "show.json", meetup: meetup)
  end

  def update(conn, %{"id" => id, "meetup" => meetup_params}) do
    meetup = Meetups.get_meetup!(id)

    with {:ok, %Meetup{} = meetup} <- Meetups.update_meetup(meetup, meetup_params) do
      render(conn, "show.json", meetup: meetup)
    end
  end

  def delete(conn, %{"id" => id}) do
    meetup = Meetups.get_meetup!(id)
    with {:ok, %Meetup{}} <- Meetups.delete_meetup(meetup) do
      send_resp(conn, :no_content, "")
    end
  end
end
