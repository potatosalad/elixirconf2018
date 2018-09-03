defmodule Share.GraphQL.Schema.Vehicle do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias Share.GraphQL.Schema

  node(object(:vehicle)) do
    field(:vin, non_null(:string))

    connection(field(:reservations, node_type: :reservation)) do
      resolve(&Schema.Reservation.list/3)
    end
  end

  connection(node_type: :vehicle)

  object(:vehicle_queries) do
    connection(field(:vehicles, node_type: :vehicle)) do
      resolve(&Schema.Vehicle.list/3)
    end
  end

  object(:vehicle_mutations) do
    payload(field(:create_vehicle)) do
      input do
        field(:vin, non_null(:string))
      end

      output do
        field(:vehicle, :vehicle)
      end

      resolve(&Schema.Vehicle.create/3)
    end
  end

  ## Query

  def fetch(reservation = %Share.Data.Reservation{}, _args, _info) do
    case Share.Repo.one(Ecto.assoc(reservation, :vehicle)) do
      nil ->
        {:error, "not found"}

      vehicle = %Share.Data.Vehicle{} ->
        {:ok, vehicle}
    end
  end

  def fetch(_parent, %{type: :vehicle, id: vehicle_id}, _info) do
    case Share.Repo.get(Share.Data.Vehicle, vehicle_id) do
      nil ->
        {:error, "not found"}

      vehicle = %Share.Data.Vehicle{} ->
        {:ok, vehicle}
    end
  end

  def list(_parent, args, _info) do
    require Ecto.Query
    queryable = Ecto.Query.from(v in Share.Data.Vehicle, order_by: [asc: v.id])
    Absinthe.Relay.Connection.from_query(queryable, &Share.Repo.all/1, args)
  end

  ## Mutation

  def create(_parent, args, info) do
    vehicle = %Share.Data.Vehicle{}
    changeset = Share.Data.Vehicle.changeset(vehicle, args)

    case Share.Repo.insert(changeset) do
      {:ok, vehicle = %Share.Data.Vehicle{}} ->
        output = %{vehicle: vehicle}
        {:ok, output}

      {:error, changeset = %Ecto.Changeset{}} ->
        reason = Share.GraphQL.Notation.Helpers.ecto_changeset_errors(changeset, info)
        {:error, reason}
    end
  end
end
