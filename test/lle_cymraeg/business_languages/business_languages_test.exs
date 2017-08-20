defmodule LleCymraeg.BusinessLanguagesTest do
  use LleCymraeg.DataCase

  alias LleCymraeg.BusinessLanguages

  describe "business_languages" do
    alias LleCymraeg.BusinessLanguages.BusinessLanguage

    @valid_attrs %{frequency: "some frequency", proficiency: "some proficiency"}
    @update_attrs %{frequency: "some updated frequency", proficiency: "some updated proficiency"}
    @invalid_attrs %{frequency: nil, proficiency: nil}

    def business_language_fixture(attrs \\ %{}) do
      {:ok, business_language} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BusinessLanguages.create_business_language()

      business_language
    end

    test "list_business_languages/0 returns all business_languages" do
      business_language = business_language_fixture()
      assert BusinessLanguages.list_business_languages() == [business_language]
    end

    test "get_business_language!/1 returns the business_language with given id" do
      business_language = business_language_fixture()
      assert BusinessLanguages.get_business_language!(business_language.id) == business_language
    end

    test "create_business_language/1 with valid data creates a business_language" do
      assert {:ok, %BusinessLanguage{} = business_language} = BusinessLanguages.create_business_language(@valid_attrs)
      assert business_language.frequency == "some frequency"
      assert business_language.proficiency == "some proficiency"
    end

    test "create_business_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BusinessLanguages.create_business_language(@invalid_attrs)
    end

    test "update_business_language/2 with valid data updates the business_language" do
      business_language = business_language_fixture()
      assert {:ok, business_language} = BusinessLanguages.update_business_language(business_language, @update_attrs)
      assert %BusinessLanguage{} = business_language
      assert business_language.frequency == "some updated frequency"
      assert business_language.proficiency == "some updated proficiency"
    end

    test "update_business_language/2 with invalid data returns error changeset" do
      business_language = business_language_fixture()
      assert {:error, %Ecto.Changeset{}} = BusinessLanguages.update_business_language(business_language, @invalid_attrs)
      assert business_language == BusinessLanguages.get_business_language!(business_language.id)
    end

    test "delete_business_language/1 deletes the business_language" do
      business_language = business_language_fixture()
      assert {:ok, %BusinessLanguage{}} = BusinessLanguages.delete_business_language(business_language)
      assert_raise Ecto.NoResultsError, fn -> BusinessLanguages.get_business_language!(business_language.id) end
    end

    test "change_business_language/1 returns a business_language changeset" do
      business_language = business_language_fixture()
      assert %Ecto.Changeset{} = BusinessLanguages.change_business_language(business_language)
    end
  end
end
