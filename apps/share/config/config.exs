use Mix.Config

config(:share, ecto_repos: [Share.Repo])

config(:share, Share.Repo, adapter: Ecto.Adapters.Postgres, types: Share.PostgresTypes)

import_config "#{Mix.env()}.exs"
