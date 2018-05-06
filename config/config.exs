# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mattdavis,
  ecto_repos: [Mattdavis.Repo]

# Configures the endpoint
config :mattdavis, MattdavisWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hhDUsE7EuIHc+689Epf7sVK8+rQUv576m6zTHM5HleZ57pqWX2pjCN96segDRq9k",
  render_errors: [view: MattdavisWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mattdavis.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
