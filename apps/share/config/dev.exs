use Mix.Config

# Configure your database
config(:share, Share.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "share_dev",
  hostname: "localhost",
  pool_size: 10,
  types: Share.PostgresTypes
)
