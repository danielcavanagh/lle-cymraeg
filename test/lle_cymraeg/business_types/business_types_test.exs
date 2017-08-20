defmodule LleCymraeg.BusinessTypesTest do
  use LleCymraeg.DataCase

  alias LleCymraeg.BusinessTypes

  describe "business_types" do
    alias LleCymraeg.BusinessTypes.BusinessType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def business_type_fixture(attrs \\ %{}) do
      {:ok, business_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BusinessTypes.create_business_type()

      business_type
    end

    test "list_business_types/0 returns all business_types" do
      business_type = business_type_fixture()
      assert BusinessTypes.list_business_types() == [business_type]
    end

    test "get_business_type!/1 returns the business_type with given id" do
      business_type = business_type_fixture()
      assert BusinessTypes.get_business_type!(business_type.id) == business_type
    end

    test "create_business_type/1 with valid data creates a business_type" do
      assert {:ok, %BusinessType{} = business_type} = BusinessTypes.create_business_type(@valid_attrs)
      assert business_type.name == "some name"
    end

    test "create_business_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BusinessTypes.create_business_type(@invalid_attrs)
    end

    test "update_business_type/2 with valid data updates the business_type" do
      business_type = business_type_fixture()
      assert {:ok, business_type} = BusinessTypes.update_business_type(business_type, @update_attrs)
      assert %BusinessType{} = business_type
      assert business_type.name == "some updated name"
    end

    test "update_business_type/2 with invalid data returns error changeset" do
      business_type = business_type_fixture()
      assert {:error, %Ecto.Changeset{}} = BusinessTypes.update_business_type(business_type, @invalid_attrs)
      assert business_type == BusinessTypes.get_business_type!(business_type.id)
    end

    test "delete_business_type/1 deletes the business_type" do
      business_type = business_type_fixture()
      assert {:ok, %BusinessType{}} = BusinessTypes.delete_business_type(business_type)
      assert_raise Ecto.NoResultsError, fn -> BusinessTypes.get_business_type!(business_type.id) end
    end

    test "change_business_type/1 returns a business_type changeset" do
      business_type = business_type_fixture()
      assert %Ecto.Changeset{} = BusinessTypes.change_business_type(business_type)
    end
  end
end
