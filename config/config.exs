# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :m307,
  ecto_repos: [M307.Repo]

config :m307, M307.Repo,
  start_apps_before_migration: [:logger]

# Configures the endpoint
config :m307, M307Web.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: M307Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: M307.PubSub,
  live_view: [signing_salt: "OLpdkqH4"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --loader:.woff=file --loader:.woff2=file --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
