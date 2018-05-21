defmodule MattdavisWeb.VisitorController do
  use MattdavisWeb, :controller

  alias Mattdavis.Attention
  alias Mattdavis.Attention.Visitor

  def index(conn, _params) do
    visitors = Attention.list_visitors()
    render(conn, "index.html", visitors: visitors)
  end

  def new(conn, _params) do
    changeset = Attention.change_visitor(%Visitor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"visitor" => visitor_params}) do
    case Attention.create_visitor(visitor_params) do
      {:ok, visitor} ->
        conn
        |> put_flash(:info, "Sending your content to " <> visitor.email <> " now.")
        |> redirect(to: visitor_path(conn, :show, visitor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    visitor = Attention.get_visitor!(id)
    render(conn, "show.html", visitor: visitor)
  end

  def edit(conn, %{"id" => id}) do
    visitor = Attention.get_visitor!(id)
    changeset = Attention.change_visitor(visitor)
    render(conn, "edit.html", visitor: visitor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "visitor" => visitor_params}) do
    visitor = Attention.get_visitor!(id)

    case Attention.update_visitor(visitor, visitor_params) do
      {:ok, visitor} ->
        conn
        |> put_flash(:info, "Visitor updated successfully.")
        |> redirect(to: visitor_path(conn, :show, visitor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", visitor: visitor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    visitor = Attention.get_visitor!(id)
    {:ok, _visitor} = Attention.delete_visitor(visitor)

    conn
    |> put_flash(:info, "Visitor deleted successfully.")
    |> redirect(to: visitor_path(conn, :index))
  end
end
