defmodule LleCymraeg.MeetupsTest do
  use LleCymraeg.DataCase

  alias LleCymraeg.Meetups

  describe "meetups" do
    alias LleCymraeg.Meetups.Meetup

    @valid_attrs %{datetime: ~N[2010-04-17 14:00:00.000000], description: "some description", is_private?: true}
    @update_attrs %{datetime: ~N[2011-05-18 15:01:01.000000], description: "some updated description", is_private?: false}
    @invalid_attrs %{datetime: nil, description: nil, is_private?: nil}

    def meetup_fixture(attrs \\ %{}) do
      {:ok, meetup} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Meetups.create_meetup()

      meetup
    end

    test "list_meetups/0 returns all meetups" do
      meetup = meetup_fixture()
      assert Meetups.list_meetups() == [meetup]
    end

    test "get_meetup!/1 returns the meetup with given id" do
      meetup = meetup_fixture()
      assert Meetups.get_meetup!(meetup.id) == meetup
    end

    test "create_meetup/1 with valid data creates a meetup" do
      assert {:ok, %Meetup{} = meetup} = Meetups.create_meetup(@valid_attrs)
      assert meetup.datetime == ~N[2010-04-17 14:00:00.000000]
      assert meetup.description == "some description"
      assert meetup.is_private? == true
    end

    test "create_meetup/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Meetups.create_meetup(@invalid_attrs)
    end

    test "update_meetup/2 with valid data updates the meetup" do
      meetup = meetup_fixture()
      assert {:ok, meetup} = Meetups.update_meetup(meetup, @update_attrs)
      assert %Meetup{} = meetup
      assert meetup.datetime == ~N[2011-05-18 15:01:01.000000]
      assert meetup.description == "some updated description"
      assert meetup.is_private? == false
    end

    test "update_meetup/2 with invalid data returns error changeset" do
      meetup = meetup_fixture()
      assert {:error, %Ecto.Changeset{}} = Meetups.update_meetup(meetup, @invalid_attrs)
      assert meetup == Meetups.get_meetup!(meetup.id)
    end

    test "delete_meetup/1 deletes the meetup" do
      meetup = meetup_fixture()
      assert {:ok, %Meetup{}} = Meetups.delete_meetup(meetup)
      assert_raise Ecto.NoResultsError, fn -> Meetups.get_meetup!(meetup.id) end
    end

    test "change_meetup/1 returns a meetup changeset" do
      meetup = meetup_fixture()
      assert %Ecto.Changeset{} = Meetups.change_meetup(meetup)
    end
  end
end
