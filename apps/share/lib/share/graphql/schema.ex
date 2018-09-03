defmodule Share.GraphQL.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  alias __MODULE__, as: Schema

  import_types(Absinthe.Type.Custom)
  import_types(Schema.Driver)
  import_types(Schema.Reservation)
  import_types(Schema.Vehicle)

  query do
    import_fields(:driver_queries)
    import_fields(:reservation_queries)
    import_fields(:vehicle_queries)

    node(field()) do
      resolve(&Schema.node_field/3)
    end
  end

  mutation do
    import_fields(:driver_mutations)
    import_fields(:reservation_mutations)
    import_fields(:vehicle_mutations)
  end

  node(interface()) do
    resolve_type(&Schema.node_interface/2)
  end

  def node_field(parent, attrs, info) do
    case attrs do
      %{type: :driver, id: _} ->
        Schema.Driver.fetch(parent, attrs, info)

      %{type: :reservation, id: _} ->
        Schema.Reservation.fetch(parent, attrs, info)

      %{type: :vehicle, id: _} ->
        Schema.Vehicle.fetch(parent, attrs, info)

      _ ->
        {:error, "bad node id"}
    end
  end

  def node_interface(type, _info) do
    case type do
      %Share.Data.Driver{} ->
        :driver

      %Share.Data.Reservation{} ->
        :reservation

      %Share.Data.Vehicle{} ->
        :vehicle

      _ ->
        nil
    end
  end
end
