# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :lle_cymraeg,
  ecto_repos: [LleCymraeg.Repo]

# Configures the endpoint
config :lle_cymraeg, LleCymraegWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("APP_SECRET"),
  render_errors: [view: LleCymraegWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LleCymraeg.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "LleCymraeg",
  ttl: { 30, :days },
  allowed_drift: 2000,
  secret_key: System.get_env("APP_SECRET"),
  serializer: LleCymraeg.GuardianSerializer

# Configure your database
config :lle_cymraeg, LleCymraeg.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 10

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
