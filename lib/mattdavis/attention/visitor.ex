defmodule Mattdavis.Attention.Visitor do
  use Ecto.Schema
  import Ecto.Changeset


  schema "visitors" do
    field :email, :string
    field :name, :string
    field :what, :string

    timestamps()
  end

  @doc false
  def changeset(visitor, attrs) do
    visitor
    |> cast(attrs, [:email, :name, :what])
    |> validate_required([:email, :name, :what])
  end
end
