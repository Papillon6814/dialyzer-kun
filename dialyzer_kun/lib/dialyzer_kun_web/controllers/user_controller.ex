defmodule DialyzerKunWeb.UserController do
  use DialyzerKunWeb, :controller

  alias DialyzerKun.Accounts

  @spec name(Plug.Conn.t(), %{required(String.t()) => String.t() | nil}) :: Plug.Conn.t()
  def name(conn, %{"user_id" => user_id}) do
    user = Accounts.get_user(user_id)

    json(conn, %{user_name: user.name})
  end
end
