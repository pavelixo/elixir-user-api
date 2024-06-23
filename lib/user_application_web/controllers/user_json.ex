defmodule UserApplicationWeb.UserJSON do
  alias UserApplication.Accounts.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    Enum.map(users, &data/1)
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    data(user)
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
    }
  end
end
