defmodule UserApplication.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :password, :string
    field :username, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
  end
end
