defmodule Mattdavis.AttentionTest do
  use Mattdavis.DataCase

  alias Mattdavis.Attention

  describe "visitors" do
    alias Mattdavis.Attention.Visitor

    @valid_attrs %{email: "some email", name: "some name", what: "some what"}
    @update_attrs %{email: "some updated email", name: "some updated name", what: "some updated what"}
    @invalid_attrs %{email: nil, name: nil, what: nil}

    def visitor_fixture(attrs \\ %{}) do
      {:ok, visitor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Attention.create_visitor()

      visitor
    end

    test "list_visitors/0 returns all visitors" do
      visitor = visitor_fixture()
      assert Attention.list_visitors() == [visitor]
    end

    test "get_visitor!/1 returns the visitor with given id" do
      visitor = visitor_fixture()
      assert Attention.get_visitor!(visitor.id) == visitor
    end

    test "create_visitor/1 with valid data creates a visitor" do
      assert {:ok, %Visitor{} = visitor} = Attention.create_visitor(@valid_attrs)
      assert visitor.email == "some email"
      assert visitor.name == "some name"
      assert visitor.what == "some what"
    end

    test "create_visitor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attention.create_visitor(@invalid_attrs)
    end

    test "update_visitor/2 with valid data updates the visitor" do
      visitor = visitor_fixture()
      assert {:ok, visitor} = Attention.update_visitor(visitor, @update_attrs)
      assert %Visitor{} = visitor
      assert visitor.email == "some updated email"
      assert visitor.name == "some updated name"
      assert visitor.what == "some updated what"
    end

    test "update_visitor/2 with invalid data returns error changeset" do
      visitor = visitor_fixture()
      assert {:error, %Ecto.Changeset{}} = Attention.update_visitor(visitor, @invalid_attrs)
      assert visitor == Attention.get_visitor!(visitor.id)
    end

    test "delete_visitor/1 deletes the visitor" do
      visitor = visitor_fixture()
      assert {:ok, %Visitor{}} = Attention.delete_visitor(visitor)
      assert_raise Ecto.NoResultsError, fn -> Attention.get_visitor!(visitor.id) end
    end

    test "change_visitor/1 returns a visitor changeset" do
      visitor = visitor_fixture()
      assert %Ecto.Changeset{} = Attention.change_visitor(visitor)
    end
  end
end
