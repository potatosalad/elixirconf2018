defmodule Share.GraphQL do
  @schema Share.GraphQL.Schema

  def introspect(options \\ []) do
    Absinthe.Schema.introspect(@schema, options)
  end

  def run(document, options \\ []) do
    Absinthe.run(document, @schema, options)
  end

  def from_global_id(global_id) do
    Absinthe.Relay.Node.from_global_id(global_id, @schema)
  end

  def to_global_id(node_type, source_id) do
    Absinthe.Relay.Node.to_global_id(node_type, source_id, @schema)
  end
end
