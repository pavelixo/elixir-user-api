defmodule UserApplication.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> validate_format(:email, ~r/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/)
    |> validate_length(:password, min: 8)
    |> hash_password()
  end

  def hash_password(changeset) do
    if changeset.valid? do
      put_change(
        changeset, :password_hash, Argon2.hash_pwd_salt(
          get_change(
            changeset, :password
            )
          )
        )
    else
      changeset
    end
  end
end
