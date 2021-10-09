defmodule DialyzerKunWeb.UserControllerTest do
  use DialyzerKunWeb.ConnCase

  alias DialyzerKun.Accounts

  describe "GET /user" do
    @valid_attrs %{age: 42, name: "some name"}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "returns user name with given id", %{conn: conn} do
      user = user_fixture()

      conn = get(conn, "/user", %{user_id: user.id})

      assert json_response(conn, 200) == %{"user_name" => @valid_attrs.name}
    end
  end
end
