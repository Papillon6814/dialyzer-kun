defmodule DialyzerKun.AccountsTest do
  use DialyzerKun.DataCase

  alias DialyzerKun.Accounts

  describe "users" do
    @valid_attrs %{age: 42, name: "some name"}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "get_user/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user(user.id) == user
    end

    test "get_user/1 returns nil with invalid id" do
      user = user_fixture()
      assert Accounts.get_user(user.id+1) == nil
    end

    test "get_user/1 raises an error with nil" do
      assert_raise ArgumentError, fn ->
        Accounts.get_user(nil)
      end
    end
  end
end
