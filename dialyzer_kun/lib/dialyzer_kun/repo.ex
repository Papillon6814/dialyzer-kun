defmodule DialyzerKun.Repo do
  use Ecto.Repo,
    otp_app: :dialyzer_kun,
    adapter: Ecto.Adapters.Postgres
end
