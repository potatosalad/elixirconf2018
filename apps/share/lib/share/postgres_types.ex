Postgrex.Types.define(
  Share.PostgresTypes,
  [Share.Postgrex.Extensions.Timestamp] ++ (Ecto.Adapters.Postgres.extensions() -- [Ecto.Adapters.Postgres.Timestamp]),
  json: Jason
)
