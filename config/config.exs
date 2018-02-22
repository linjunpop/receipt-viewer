# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :receipt_viewer, namespace: RViewer

# Configures the endpoint
config :receipt_viewer, RViewerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Hp5jrfU4uB2MJCggZP1FpUXrfIXRb0hBDEWaLNYEgrfNQOn8mBagytTk+SwprHJW",
  render_errors: [view: RViewerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RViewer.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
