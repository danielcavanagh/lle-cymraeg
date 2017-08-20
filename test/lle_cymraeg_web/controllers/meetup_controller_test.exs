defmodule LleCymraegWeb.MeetupControllerTest do
  use LleCymraegWeb.ConnCase

  alias LleCymraeg.Meetups
  alias LleCymraeg.Meetups.Meetup

  @create_attrs %{datetime: ~N[2010-04-17 14:00:00.000000], description: "some description", is_private?: true}
  @update_attrs %{datetime: ~N[2011-05-18 15:01:01.000000], description: "some updated description", is_private?: false}
  @invalid_attrs %{datetime: nil, description: nil, is_private?: nil}

  def fixture(:meetup) do
    {:ok, meetup} = Meetups.create_meetup(@create_attrs)
    meetup
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all meetups", %{conn: conn} do
      conn = get conn, meetup_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create meetup" do
    test "renders meetup when data is valid", %{conn: conn} do
      conn = post conn, meetup_path(conn, :create), meetup: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, meetup_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "datetime" => ~N[2010-04-17 14:00:00.000000],
        "description" => "some description",
        "is_private?" => true}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, meetup_path(conn, :create), meetup: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update meetup" do
    setup [:create_meetup]

    test "renders meetup when data is valid", %{conn: conn, meetup: %Meetup{id: id} = meetup} do
      conn = put conn, meetup_path(conn, :update, meetup), meetup: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, meetup_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "datetime" => ~N[2011-05-18 15:01:01.000000],
        "description" => "some updated description",
        "is_private?" => false}
    end

    test "renders errors when data is invalid", %{conn: conn, meetup: meetup} do
      conn = put conn, meetup_path(conn, :update, meetup), meetup: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete meetup" do
    setup [:create_meetup]

    test "deletes chosen meetup", %{conn: conn, meetup: meetup} do
      conn = delete conn, meetup_path(conn, :delete, meetup)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, meetup_path(conn, :show, meetup)
      end
    end
  end

  defp create_meetup(_) do
    meetup = fixture(:meetup)
    {:ok, meetup: meetup}
  end
end
