defmodule DialyzerKun.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DialyzerKun.Repo,
      # Start the Telemetry supervisor
      DialyzerKunWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DialyzerKun.PubSub},
      # Start the Endpoint (http/https)
      DialyzerKunWeb.Endpoint
      # Start a worker by calling: DialyzerKun.Worker.start_link(arg)
      # {DialyzerKun.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DialyzerKun.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DialyzerKunWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
