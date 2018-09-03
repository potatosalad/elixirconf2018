defmodule Share.GraphQL.Schema.Driver do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias Share.GraphQL.Schema

  node(object(:driver)) do
    field(:name, non_null(:string))
    field(:approved, non_null(:boolean))

    connection(field(:reservations, node_type: :reservation)) do
      resolve(&Schema.Reservation.list/3)
    end
  end

  connection(node_type: :driver)

  object(:driver_queries) do
    connection(field(:drivers, node_type: :driver)) do
      resolve(&Schema.Driver.list/3)
    end
  end

  object(:driver_mutations) do
    payload(field(:create_driver)) do
      input do
        field(:name, non_null(:string))
      end

      output do
        field(:driver, :driver)
      end

      resolve(&Schema.Driver.create/3)
    end

    payload(field(:approve_driver)) do
      input do
        field(:id, non_null(:id))
      end

      output do
        field(:driver, :driver)
      end

      resolve(Share.GraphQL.Notation.Helpers.parse_node_ids(&Schema.Driver.approve/3, id: :driver))
    end

    payload(field(:suspend_driver)) do
      input do
        field(:id, non_null(:id))
      end

      output do
        field(:driver, :driver)
      end

      resolve(Share.GraphQL.Notation.Helpers.parse_node_ids(&Schema.Driver.suspend/3, id: :driver))
    end
  end

  ## Query

  def fetch(reservation = %Share.Data.Reservation{}, _args, _info) do
    case Share.Repo.one(Ecto.assoc(reservation, :driver)) do
      nil ->
        {:error, "not found"}

      driver = %Share.Data.Driver{} ->
        {:ok, driver}
    end
  end

  def fetch(_parent, %{type: :driver, id: driver_id}, _info) do
    case Share.Repo.get(Share.Data.Driver, driver_id) do
      nil ->
        {:error, "not found"}

      driver = %Share.Data.Driver{} ->
        {:ok, driver}
    end
  end

  def list(_parent, args, _info) do
    require Ecto.Query
    queryable = Ecto.Query.from(d in Share.Data.Driver, order_by: [asc: d.id])
    Absinthe.Relay.Connection.from_query(queryable, &Share.Repo.all/1, args)
  end

  ## Mutation

  def create(_parent, args, info) do
    driver = %Share.Data.Driver{}
    changeset = Share.Data.Driver.changeset(driver, args)

    case Share.Repo.insert(changeset) do
      {:ok, driver = %Share.Data.Driver{}} ->
        output = %{driver: driver}
        {:ok, output}

      {:error, changeset = %Ecto.Changeset{}} ->
        reason = Share.GraphQL.Notation.Helpers.ecto_changeset_errors(changeset, info)
        {:error, reason}
    end
  end

  def approve(_parent, %{id: driver_id}, info) do
    case Share.Repo.get(Share.Data.Driver, driver_id) do
      driver = %Share.Data.Driver{} ->
        changeset = Share.Data.Driver.changeset(driver, %{approved: true})

        case Share.Repo.update(changeset) do
          {:ok, driver = %Share.Data.Driver{}} ->
            output = %{driver: driver}
            {:ok, output}

          {:error, changeset = %Ecto.Changeset{}} ->
            reason = Share.GraphQL.Notation.Helpers.ecto_changeset_errors(changeset, info)
            {:error, reason}
        end

      nil ->
        {:error, "not found"}
    end
  end

  def suspend(_parent, %{id: driver_id}, info) do
    case Share.Repo.get(Share.Data.Driver, driver_id) do
      driver = %Share.Data.Driver{} ->
        changeset = Share.Data.Driver.changeset(driver, %{approved: false})

        case Share.Repo.update(changeset) do
          {:ok, driver = %Share.Data.Driver{}} ->
            output = %{driver: driver}
            {:ok, output}

          {:error, changeset = %Ecto.Changeset{}} ->
            reason = Share.GraphQL.Notation.Helpers.ecto_changeset_errors(changeset, info)
            {:error, reason}
        end

      nil ->
        {:error, "not found"}
    end
  end
end
