defmodule UserApplication.Repo do
  use Ecto.Repo,
    otp_app: :user_application,
    adapter: Ecto.Adapters.SQLite3
end
