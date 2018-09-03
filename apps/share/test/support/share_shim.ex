defmodule ShareShim do
  def set_time(now) do
    now
  end

  def add_driver_new(now, name) do
    query = """
    mutation CreateDriver($input: CreateDriverInput!) {
      createDriver(input: $input) {
        driver {
          id
          name
        }
      }
    }
    """

    variables = %{"input" => %{"name" => name}}

    case Share.GraphQL.run(query, context: %{now: now}, variables: variables) do
      {:ok, %{data: %{"createDriver" => %{"driver" => %{"id" => driver_id, "name" => ^name}}}}} ->
        driver_id
    end
  end

  def approve_driver(now, driver_id) do
    query = """
    mutation ApproveDriver($input: ApproveDriverInput!) {
      approveDriver(input: $input) {
        driver {
          id
          approved
        }
      }
    }
    """

    variables = %{"input" => %{"id" => driver_id}}

    case Share.GraphQL.run(query, context: %{now: now}, variables: variables) do
      {:ok, %{data: %{"approveDriver" => %{"driver" => %{"id" => ^driver_id, "approved" => approved}}}}} ->
        approved
    end
  end

  def suspend_driver(now, driver_id) do
    query = """
    mutation SuspendDriver($input: SuspendDriverInput!) {
      suspendDriver(input: $input) {
        driver {
          id
          approved
        }
      }
    }
    """

    variables = %{"input" => %{"id" => driver_id}}

    case Share.GraphQL.run(query, context: %{now: now}, variables: variables) do
      {:ok, %{data: %{"suspendDriver" => %{"driver" => %{"id" => ^driver_id, "approved" => approved}}}}} ->
        approved
    end
  end

  def add_vehicle_new(now, vin) do
    query = """
    mutation CreateVehicle($input: CreateVehicleInput!) {
      createVehicle(input: $input) {
        vehicle {
          id
          vin
        }
      }
    }
    """

    variables = %{"input" => %{"vin" => vin}}

    case Share.GraphQL.run(query, context: %{now: now}, variables: variables) do
      {:ok, %{data: %{"createVehicle" => %{"vehicle" => %{"id" => vehicle_id, "vin" => ^vin}}}}} ->
        vehicle_id
    end
  end

  def start_reservation_valid(now, driver_id, vehicle_id) do
    case start_reservation(now, driver_id, vehicle_id) do
      {:ok, reservation_id} when is_binary(reservation_id) ->
        reservation_id
    end
  end

  def start_reservation_invalid(now, driver_id, vehicle_id) do
    case start_reservation(now, driver_id, vehicle_id) do
      {:errors, [%{message: "driver not approved"}]} ->
        false

      {:errors, [%{message: "driverId violates an exclusion constraint"}]} ->
        false

      {:errors, [%{message: "vehicleId violates an exclusion constraint"}]} ->
        false
    end
  end

  def start_reservation_invalid_driver(now, driver_id, vehicle_id) do
    start_reservation_invalid(now, driver_id, vehicle_id)
  end

  def start_reservation_unapproved_driver(now, driver_id, vehicle_id) do
    start_reservation_invalid(now, driver_id, vehicle_id)
  end

  def start_reservation_invalid_vehicle(now, driver_id, vehicle_id) do
    start_reservation_invalid(now, driver_id, vehicle_id)
  end

  def stop_reservation_started(now, reservation_id) do
    case stop_reservation(now, reservation_id) do
      {:ok, stopped} ->
        stopped
    end
  end

  def stop_reservation_stopped(now, reservation_id) do
    case stop_reservation(now, reservation_id) do
      {:errors, [%{message: "reservation already stopped"}]} ->
        true
    end
  end

  @doc false
  defp start_reservation(now, driver_id, vehicle_id) do
    query = """
    mutation StartReservation($input: StartReservationInput!) {
      startReservation(input: $input) {
        reservation {
          id
          driver {
            id
          }
          vehicle {
            id
          }
          stop
        }
      }
    }
    """

    variables = %{"input" => %{"driverId" => driver_id, "vehicleId" => vehicle_id}}

    case Share.GraphQL.run(query, context: %{now: now}, variables: variables) do
      {:ok,
       %{
         data: %{
           "startReservation" => %{
             "reservation" => %{
               "id" => reservation_id,
               "driver" => %{"id" => ^driver_id},
               "vehicle" => %{"id" => ^vehicle_id},
               "stop" => nil
             }
           }
         }
       }} ->
        {:ok, reservation_id}

      {:ok, %{data: %{"startReservation" => nil}, errors: errors}} ->
        {:errors, errors}
    end
  end

  @doc false
  defp stop_reservation(now, reservation_id) do
    query = """
    mutation StopReservation($input: StopReservationInput!) {
      stopReservation(input: $input) {
        reservation {
          id
          stop
        }
      }
    }
    """

    variables = %{"input" => %{"id" => reservation_id}}

    case Share.GraphQL.run(query, context: %{now: now}, variables: variables) do
      {:ok, %{data: %{"stopReservation" => %{"reservation" => %{"id" => ^reservation_id, "stop" => stop}}}}}
      when not is_nil(stop) ->
        {:ok, true}

      {:ok, %{data: %{"stopReservation" => nil}, errors: errors}} ->
        {:errors, errors}
    end
  end
end
