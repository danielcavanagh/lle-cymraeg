defmodule LleCymraeg.PeopleTest do
  use LleCymraeg.DataCase

  alias LleCymraeg.People

  describe "people" do
    alias LleCymraeg.People.Person

    @valid_attrs %{bio: "some bio", dob: ~D[2010-04-17], is_public?: true, name: "some name", travel_time: 42}
    @update_attrs %{bio: "some updated bio", dob: ~D[2011-05-18], is_public?: false, name: "some updated name", travel_time: 43}
    @invalid_attrs %{bio: nil, dob: nil, is_public?: nil, name: nil, travel_time: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> People.create_person()

      person
    end

    test "list_people/0 returns all people" do
      person = person_fixture()
      assert People.list_people() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert People.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = People.create_person(@valid_attrs)
      assert person.bio == "some bio"
      assert person.dob == ~D[2010-04-17]
      assert person.is_public? == true
      assert person.name == "some name"
      assert person.travel_time == 42
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, person} = People.update_person(person, @update_attrs)
      assert %Person{} = person
      assert person.bio == "some updated bio"
      assert person.dob == ~D[2011-05-18]
      assert person.is_public? == false
      assert person.name == "some updated name"
      assert person.travel_time == 43
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_person(person, @invalid_attrs)
      assert person == People.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = People.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> People.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = People.change_person(person)
    end
  end
end
