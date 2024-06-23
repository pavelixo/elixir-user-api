defmodule UserApplicationWeb.UserController do
  use UserApplicationWeb, :controller

  alias UserApplication.Accounts
  alias UserApplicationWeb.ErrorJSON

  action_fallback UserApplicationWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, :index, users: users)
  end

  def show(conn, %{"id" => id}) do
    try do
      user = Accounts.get_user!(id)
      conn
      |> put_status(:found)
      |> render(:show, user: user)
    rescue
      Ecto.NoResultsError  ->
        conn
        |> put_status(:not_found)
        |> put_view(json: ErrorJSON)
        |> render(:"404")
    end
  end

  def register(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(:show, user: user)
      {:error, _} ->
        conn
        |> put_status(:unprocessable_entity)
        |> put_view(json: ErrorJSON)
        |> render(:"401")
    end
  rescue
    Ecto.ConstraintError ->
      conn
      |> put_status(:unprocessable_entity)
      |> put_view(json: ErrorJSON)
      |> render(:"401")
  end

  def login(conn, %{"user" => user_params}) do
    case authenticate_user(user_params["username"], user_params["password"]) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render(:show, user: user)
      {:error, :unauthorized} ->
        conn
        |> put_status(:unauthorized)
        |> put_view(json: ErrorJSON)
        |> render(:"401")
    end
  end

  defp authenticate_user(username, password) do
    case Accounts.authenticate_user(username, password) do
      {:ok, user} -> {:ok, user}
      _ -> {:error, :unauthorized}
    end
  end
end
