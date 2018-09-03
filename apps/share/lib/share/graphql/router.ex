defmodule Share.GraphQL.Router do
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: OJSON
  )

  plug(:setup_absinthe_context)

  @doc false
  defp setup_absinthe_context(conn, _opts) do
    Absinthe.Plug.put_options(conn, context: %{now: DateTime.utc_now()})
  end

  plug(:match)
  plug(:dispatch)

  forward("/api/graphql",
    to: Absinthe.Plug,
    init_opts: [schema: Share.GraphQL.Schema, json_codec: OJSON]
  )

  forward("/api/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: Share.GraphQL.Schema, json_codec: OJSON, interface: :playground]
  )

  match(_) do
    send_resp(conn, 404, "not found")
  end
end
