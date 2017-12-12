# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pasti,
  ecto_repos: [Pasti.Repo]

# Configures the endpoint
config :pasti, PastiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Pkc4LorK9Ycv6Q4XtXS8IMVuRE0ZFlkjURh1678/LMCMWPDWblxzvl/AQt5qvO02",
  render_errors: [view: PastiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pasti.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
