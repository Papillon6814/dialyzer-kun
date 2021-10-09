defmodule DialyzerKun.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
    age: integer(),
    name: String.t(),
    inserted_at: any(),
    updated_at: any()
  }

  schema "users" do
    field :age, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
