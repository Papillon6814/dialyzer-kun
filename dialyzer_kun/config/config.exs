# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dialyzer_kun,
  ecto_repos: [DialyzerKun.Repo]

# Configures the endpoint
config :dialyzer_kun, DialyzerKunWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CO1tbnABpkk41dSFCLPhSHZEn7alXNVHczX32dvL0hhxykby5F25VwhcNg8pmisv",
  render_errors: [view: DialyzerKunWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DialyzerKun.PubSub,
  live_view: [signing_salt: "vAnW7V/w"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
