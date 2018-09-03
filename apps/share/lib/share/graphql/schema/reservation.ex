defmodule Share.GraphQL.Schema.Reservation do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias Share.GraphQL.Schema

  node(object(:reservation)) do
    field(:driver, non_null(:driver), resolve: &Schema.Driver.fetch/3)
    field(:vehicle, non_null(:vehicle), resolve: &Schema.Vehicle.fetch/3)
    field(:duration, non_null(:integer), resolve: &Schema.Reservation.field_duration/3)
    field(:start, non_null(:datetime), resolve: &Schema.Reservation.field_start/3)
    field(:stop, :datetime, resolve: &Schema.Reservation.field_stop/3)
  end

  connection(node_type: :reservation)

  object(:reservation_queries) do
    connection(field(:reservations, node_type: :reservation)) do
      resolve(&Schema.Reservation.list/3)
    end
  end

  object(:reservation_mutations) do
    payload(field(:start_reservation)) do
      input do
        field(:driver_id, non_null(:id))
        field(:vehicle_id, non_null(:id))
      end

      output do
        field(:reservation, :reservation)
      end

      resolve(Share.GraphQL.Notation.Helpers.parse_node_ids(&Schema.Reservation.start/3, driver_id: :driver, vehicle_id: :vehicle))
    end

    payload(field(:stop_reservation)) do
      input do
        field(:id, non_null(:id))
      end

      output do
        field(:reservation, :reservation)
      end

      resolve(Share.GraphQL.Notation.Helpers.parse_node_ids(&Schema.Reservation.stop/3, id: :reservation))
    end
  end

  ## Field

  def field_duration(%Share.Data.Reservation{start: start, stop: stop}, _args, _info = %{context: %{now: now}}) do
    stop =
      case stop do
        :infinity ->
          case now do
            %DateTime{} ->
              DateTime.to_naive(now)

            %NaiveDateTime{} ->
              now
          end

        %NaiveDateTime{} ->
          stop
      end

    value = NaiveDateTime.diff(stop, start, :second)
    {:ok, value}
  end

  def field_start(%Share.Data.Reservation{start: value}, _args, _info) do
    case value do
      %DateTime{} ->
        {:ok, value}

      %NaiveDateTime{} ->
        value = DateTime.from_naive!(value, "Etc/UTC")
        {:ok, value}
    end
  end

  def field_stop(%Share.Data.Reservation{stop: value}, _args, _info) do
    case value do
      :infinity ->
        {:ok, nil}

      %DateTime{} ->
        {:ok, value}

      %NaiveDateTime{} ->
        value = DateTime.from_naive!(value, "Etc/UTC")
        {:ok, value}
    end
  end

  ## Query

  def fetch(_parent, %{type: :reservation, id: reservation_id}, _info) do
    case Share.Repo.get(Share.Data.Reservation, reservation_id) do
      nil ->
        {:error, "not found"}

      reservation = %Share.Data.Reservation{} ->
        {:ok, reservation}
    end
  end

  def list(driver = %Share.Data.Driver{}, args, _info) do
    require Ecto.Query
    queryable = Ecto.Query.from(r in Ecto.assoc(driver, :reservations), order_by: [asc: r.id])
    Absinthe.Relay.Connection.from_query(queryable, &Share.Repo.all/1, args)
  end

  def list(vehicle = %Share.Data.Vehicle{}, args, _info) do
    require Ecto.Query
    queryable = Ecto.Query.from(r in Ecto.assoc(vehicle, :reservations), order_by: [asc: r.id])
    Absinthe.Relay.Connection.from_query(queryable, &Share.Repo.all/1, args)
  end

  def list(_parent, args, _info) do
    require Ecto.Query
    queryable = Ecto.Query.from(r in Share.Data.Reservation, order_by: [asc: r.id])
    Absinthe.Relay.Connection.from_query(queryable, &Share.Repo.all/1, args)
  end

  ## Mutation

  def start(_parent, %{driver_id: driver_id, vehicle_id: vehicle_id}, info = %{context: %{now: now}}) do
    Ecto.Multi.new()
    |> Ecto.Multi.run(:driver, fn _ ->
      case Share.Repo.get(Share.Data.Driver, driver_id) do
        driver = %Share.Data.Driver{approved: true} ->
          {:ok, driver}

        _driver = %Share.Data.Driver{approved: false} ->
          {:error, "not approved"}

        nil ->
          {:error, "not found"}
      end
    end)
    |> Ecto.Multi.run(:vehicle, fn _ ->
      case Share.Repo.get(Share.Data.Vehicle, vehicle_id) do
        vehicle = %Share.Data.Vehicle{} ->
          {:ok, vehicle}

        nil ->
          {:error, "not found"}
      end
    end)
    |> Ecto.Multi.merge(fn %{driver: %{id: driver_id}, vehicle: %{id: vehicle_id}} ->
      attrs = %{
        driver_id: driver_id,
        vehicle_id: vehicle_id,
        start: now,
        stop: :infinity
      }

      reservation = %Share.Data.Reservation{}
      changeset = Share.Data.Reservation.changeset(reservation, attrs)

      Ecto.Multi.new()
      |> Ecto.Multi.insert(:reservation, changeset)
    end)
    |> Share.Repo.transaction()
    |> case do
      {:ok, %{reservation: reservation = %Share.Data.Reservation{}}} ->
        output = %{reservation: reservation}
        {:ok, output}

      {:error, :driver, reason, _data} when is_binary(reason) ->
        {:error, "driver #{reason}"}

      {:error, :vehicle, reason, _data} when is_binary(reason) ->
        {:error, "vehicle #{reason}"}

      {:error, :reservation, changeset = %Ecto.Changeset{}, _data} ->
        reason = Share.GraphQL.Notation.Helpers.ecto_changeset_errors(changeset, info)
        {:error, reason}
    end
  end

  def stop(_parent, %{id: reservation_id}, _info = %{context: %{now: now}}) do
    Ecto.Multi.new()
    |> Ecto.Multi.run(:old_reservation, fn _ ->
      case Share.Repo.get(Share.Data.Reservation, reservation_id) do
        reservation = %Share.Data.Reservation{stop: :infinity} ->
          {:ok, reservation}

        _reservation = %Share.Data.Reservation{} ->
          {:error, "already stopped"}

        nil ->
          {:error, "not found"}
      end
    end)
    |> Ecto.Multi.merge(fn %{old_reservation: %{id: reservation_id}} ->
      require Ecto.Query
      queryable = Ecto.Query.from(r in Share.Data.Reservation, where: r.id == ^reservation_id and r.stop == ^:infinity)

      Ecto.Multi.new()
      |> Ecto.Multi.update_all(:updated_reservations, queryable, [set: [stop: now]], returning: true)
    end)
    |> Share.Repo.transaction()
    |> case do
      {:ok, %{updated_reservations: {1, [reservation = %Share.Data.Reservation{}]}}} ->
        output = %{reservation: reservation}
        {:ok, output}

      {:error, :old_reservation, reason, _data} when is_binary(reason) ->
        {:error, "reservation #{reason}"}
    end
  end
end
