defmodule LleCymraeg.PersonLanguagesTest do
  use LleCymraeg.DataCase

  alias LleCymraeg.PersonLanguages

  describe "person_languages" do
    alias LleCymraeg.PersonLanguages.PersonLanguage

    @valid_attrs %{proficiency: "some proficiency"}
    @update_attrs %{proficiency: "some updated proficiency"}
    @invalid_attrs %{proficiency: nil}

    def person_language_fixture(attrs \\ %{}) do
      {:ok, person_language} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PersonLanguages.create_person_language()

      person_language
    end

    test "list_person_languages/0 returns all person_languages" do
      person_language = person_language_fixture()
      assert PersonLanguages.list_person_languages() == [person_language]
    end

    test "get_person_language!/1 returns the person_language with given id" do
      person_language = person_language_fixture()
      assert PersonLanguages.get_person_language!(person_language.id) == person_language
    end

    test "create_person_language/1 with valid data creates a person_language" do
      assert {:ok, %PersonLanguage{} = person_language} = PersonLanguages.create_person_language(@valid_attrs)
      assert person_language.proficiency == "some proficiency"
    end

    test "create_person_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PersonLanguages.create_person_language(@invalid_attrs)
    end

    test "update_person_language/2 with valid data updates the person_language" do
      person_language = person_language_fixture()
      assert {:ok, person_language} = PersonLanguages.update_person_language(person_language, @update_attrs)
      assert %PersonLanguage{} = person_language
      assert person_language.proficiency == "some updated proficiency"
    end

    test "update_person_language/2 with invalid data returns error changeset" do
      person_language = person_language_fixture()
      assert {:error, %Ecto.Changeset{}} = PersonLanguages.update_person_language(person_language, @invalid_attrs)
      assert person_language == PersonLanguages.get_person_language!(person_language.id)
    end

    test "delete_person_language/1 deletes the person_language" do
      person_language = person_language_fixture()
      assert {:ok, %PersonLanguage{}} = PersonLanguages.delete_person_language(person_language)
      assert_raise Ecto.NoResultsError, fn -> PersonLanguages.get_person_language!(person_language.id) end
    end

    test "change_person_language/1 returns a person_language changeset" do
      person_language = person_language_fixture()
      assert %Ecto.Changeset{} = PersonLanguages.change_person_language(person_language)
    end
  end
end
