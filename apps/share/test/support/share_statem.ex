defmodule ShareStateM do
  use PropCheck
  use PropCheck.StateM
  import ShareGen

  def sample() do
    :proper_gen.sample(:proper_statem.commands(__MODULE__))
  end

  def parallel_sample() do
    :proper_gen.sample(:proper_statem.parallel_commands(__MODULE__))
  end

  defmodule State do
    defstruct drivers: %{}, approved: MapSet.new(), now: nil, vehicles: %{}, started: %{}, stopped: %{}

    def new() do
      %__MODULE__{}
    end

    def set_time(state = %__MODULE__{}, now) do
      %__MODULE__{state | now: now}
    end

    ## Driver

    def create_driver(state = %__MODULE__{drivers: drivers}, id, name) do
      drivers = Map.put(drivers, id, name)
      %__MODULE__{state | drivers: drivers}
    end

    def approve_driver(state = %__MODULE__{approved: approved}, driver_id) do
      approved = MapSet.put(approved, driver_id)
      %__MODULE__{state | approved: approved}
    end

    def suspend_driver(state = %__MODULE__{approved: approved}, driver_id) do
      approved = MapSet.delete(approved, driver_id)
      %__MODULE__{state | approved: approved}
    end

    def has_available_drivers?(%__MODULE__{approved: approved, started: started}) do
      excluded_driver_ids = for {_, %{driver_id: driver_id}} <- started, into: [], do: driver_id
      possible_driver_ids = MapSet.to_list(approved)
      length(possible_driver_ids -- excluded_driver_ids) > 0
    end

    def has_unapproved_drivers?(%__MODULE__{drivers: drivers, approved: approved, started: started}) do
      excluded_driver_ids = for {_, %{driver_id: driver_id}} <- started, into: [], do: driver_id
      excluded_driver_ids = excluded_driver_ids ++ MapSet.to_list(approved)
      possible_driver_ids = Map.keys(drivers)
      length(possible_driver_ids -- excluded_driver_ids) > 0
    end

    def has_driver_id?(%__MODULE__{drivers: drivers}, id) do
      Map.has_key?(drivers, id)
    end

    def is_driver_approved?(%__MODULE__{approved: approved}, id) do
      MapSet.member?(approved, id)
    end

    ## Vehicle

    def create_vehicle(state = %__MODULE__{vehicles: vehicles}, id, vin) do
      vehicles = Map.put(vehicles, id, vin)
      %__MODULE__{state | vehicles: vehicles}
    end

    def has_available_vehicles?(%__MODULE__{vehicles: vehicles, started: started}) do
      excluded_vehicle_ids = for {_, %{vehicle_id: vehicle_id}} <- started, into: [], do: vehicle_id
      possible_vehicle_ids = Map.keys(vehicles)
      length(possible_vehicle_ids -- excluded_vehicle_ids) > 0
    end

    def has_vehicle_vin?(%__MODULE__{vehicles: vehicles}, vin) do
      :lists.member(vin, Map.values(vehicles))
    end

    ## Reservation

    def start_reservation(state = %__MODULE__{started: started}, now, id, driver_id, vehicle_id) do
      reservation = %{
        driver_id: driver_id,
        vehicle_id: vehicle_id,
        start: now,
        stop: :infinity
      }

      started = Map.put(started, id, reservation)
      %__MODULE__{state | started: started}
    end

    def stop_reservation(state = %__MODULE__{started: started, stopped: stopped}, now, reservation_id) do
      {reservation, new_started} = :maps.take(reservation_id, started)
      reservation = %{reservation | stop: now}
      new_stopped = Map.put(stopped, reservation_id, reservation)
      %__MODULE__{state | started: new_started, stopped: new_stopped}
    end

    def is_reservation_started?(%__MODULE__{started: started}, reservation_id) do
      Map.has_key?(started, reservation_id)
    end

    def is_reservation_stopped?(%__MODULE__{stopped: stopped}, reservation_id) do
      Map.has_key?(stopped, reservation_id)
    end

    def reservable?(state = %__MODULE__{drivers: drivers, vehicles: vehicles, started: started}, _now, driver_id, vehicle_id) do
      if Map.has_key?(drivers, driver_id) and Map.has_key?(vehicles, vehicle_id) and is_driver_approved?(state, driver_id) do
        not Enum.any?(started, fn {_, %{driver_id: d, vehicle_id: v}} ->
          d == driver_id or v == vehicle_id
        end)
      else
        false
      end
    end
  end

  alias __MODULE__.State

  @impl :proper_statem
  def initial_state() do
    State.new()
  end

  @impl :proper_statem
  def command(_state = %State{now: nil}) do
    return({:call, ShareShim, :set_time, [datetime()]})
  end

  def command(state = %State{now: now}) do
    time_commands = [
      {:call, ShareShim, :set_time, [future_datetime(now, range(0, 60))]}
    ]

    create_commands = [
      {:call, ShareShim, :add_driver_new, [now, driver_name()]},
      {:call, ShareShim, :add_vehicle_new, [now, vehicle_vin()]}
    ]

    driver_commands =
      case state do
        %State{drivers: drivers} when map_size(drivers) === 0 ->
          []

        _ ->
          [
            {:call, ShareShim, :approve_driver, [now, driver_id(state)]},
            {:call, ShareShim, :suspend_driver, [now, driver_id(state)]}
          ]
      end

    reservation_commands =
      case state do
        %State{drivers: drivers, vehicles: vehicles} when map_size(drivers) === 0 or map_size(vehicles) === 0 ->
          []

        _ ->
          start_commands =
            if State.has_available_drivers?(state) and State.has_available_vehicles?(state) do
              [
                {:call, ShareShim, :start_reservation_valid, [now, available_driver_id(state), available_vehicle_id(state)]}
              ]
            else
              []
            end

          stop_commands =
            case state do
              %State{started: started, stopped: stopped} when map_size(started) === 0 and map_size(stopped) === 0 ->
                []

              %State{started: started, stopped: stopped} ->
                calls = [
                  :start_reservation_invalid,
                  :start_reservation_invalid_driver,
                  :start_reservation_unapproved_driver,
                  :start_reservation_invalid_vehicle,
                  :stop_reservation_started,
                  :stop_reservation_stopped
                ]

                Enum.reduce(calls, [], fn
                  :start_reservation_invalid, acc ->
                    if map_size(started) === 0 do
                      acc
                    else
                      [
                        {:call, ShareShim, :start_reservation_invalid,
                         [now, unavailable_driver_id(state), unavailable_vehicle_id(state)]}
                        | acc
                      ]
                    end

                  :start_reservation_invalid_driver, acc ->
                    if map_size(started) > 0 and State.has_available_vehicles?(state) do
                      [
                        {:call, ShareShim, :start_reservation_invalid_driver,
                         [now, unavailable_driver_id(state), available_vehicle_id(state)]}
                        | acc
                      ]
                    else
                      acc
                    end

                  :start_reservation_unapproved_driver, acc ->
                    if State.has_unapproved_drivers?(state) do
                      if State.has_available_vehicles?(state) do
                        [
                          {:call, ShareShim, :start_reservation_unapproved_driver,
                           [now, unapproved_driver_id(state), available_vehicle_id(state)]}
                          | acc
                        ]
                      else
                        [
                          {:call, ShareShim, :start_reservation_unapproved_driver,
                           [now, unapproved_driver_id(state), unavailable_vehicle_id(state)]}
                          | acc
                        ]
                      end
                    else
                      acc
                    end

                  :start_reservation_invalid_vehicle, acc ->
                    if map_size(started) > 0 and State.has_available_drivers?(state) do
                      [
                        {:call, ShareShim, :start_reservation_invalid_vehicle,
                         [now, available_driver_id(state), unavailable_vehicle_id(state)]}
                        | acc
                      ]
                    else
                      acc
                    end

                  :stop_reservation_started, acc ->
                    if map_size(started) === 0 do
                      acc
                    else
                      [{:call, ShareShim, :stop_reservation_started, [now, started_reservation_id(state)]} | acc]
                    end

                  :stop_reservation_stopped, acc ->
                    if map_size(stopped) === 0 do
                      acc
                    else
                      [{:call, ShareShim, :stop_reservation_stopped, [now, stopped_reservation_id(state)]} | acc]
                    end
                end)
            end

          start_commands ++ stop_commands
      end

    case {driver_commands, reservation_commands} do
      {[], []} ->
        frequency([
          {99, oneof(create_commands)},
          {1, oneof(time_commands)}
        ])

      {[_ | _], []} ->
        frequency([
          {80, oneof(create_commands)},
          {10, oneof(driver_commands)},
          {1, oneof(time_commands)}
        ])

      {[_ | _], [_ | _]} ->
        frequency([
          {80, oneof(reservation_commands)},
          {10, oneof(create_commands)},
          {10, oneof(driver_commands)},
          {1, oneof(time_commands)}
        ])
    end
  end

  @impl :proper_statem
  def precondition(_state, {:call, _, :set_time, [_now]}) do
    true
  end

  def precondition(_state, {:call, _, :add_driver_new, [_now, _name]}) do
    true
  end

  def precondition(state, {:call, _, :add_vehicle_new, [_now, vin]}) do
    not State.has_vehicle_vin?(state, vin)
  end

  def precondition(state, {:call, _, :approve_driver, [_now, driver_id]}) do
    State.has_driver_id?(state, driver_id)
  end

  def precondition(state, {:call, _, :suspend_driver, [_now, driver_id]}) do
    State.has_driver_id?(state, driver_id)
  end

  def precondition(state, {:call, _, :start_reservation_valid, [now, driver_id, vehicle_id]}) do
    State.reservable?(state, now, driver_id, vehicle_id)
  end

  def precondition(state, {:call, _, :start_reservation_invalid, [now, driver_id, vehicle_id]}) do
    not State.reservable?(state, now, driver_id, vehicle_id)
  end

  def precondition(state, {:call, _, :start_reservation_invalid_driver, [now, driver_id, vehicle_id]}) do
    not State.reservable?(state, now, driver_id, vehicle_id)
  end

  def precondition(state, {:call, _, :start_reservation_unapproved_driver, [now, driver_id, vehicle_id]}) do
    not State.reservable?(state, now, driver_id, vehicle_id)
  end

  def precondition(state, {:call, _, :start_reservation_invalid_vehicle, [now, driver_id, vehicle_id]}) do
    not State.reservable?(state, now, driver_id, vehicle_id)
  end

  def precondition(state, {:call, _, :stop_reservation_started, [_now, reservation_id]}) do
    State.is_reservation_started?(state, reservation_id)
  end

  def precondition(state, {:call, _, :stop_reservation_stopped, [_now, reservation_id]}) do
    State.is_reservation_stopped?(state, reservation_id)
  end

  @impl :proper_statem
  def postcondition(_state, {:call, _, :set_time, [now]}, now) do
    true
  end

  def postcondition(_state, {:call, _, :add_driver_new, [_now, _name]}, driver_id) do
    is_binary(driver_id)
  end

  def postcondition(state, {:call, _, :add_vehicle_new, [_now, vin]}, vehicle_id) do
    not State.has_vehicle_vin?(state, vin) and is_binary(vehicle_id)
  end

  def postcondition(state, {:call, _, :approve_driver, [_now, driver_id]}, approved) do
    State.has_driver_id?(state, driver_id) and approved == true
  end

  def postcondition(state, {:call, _, :suspend_driver, [_now, driver_id]}, approved) do
    State.has_driver_id?(state, driver_id) and approved == false
  end

  def postcondition(state, {:call, _, :start_reservation_valid, [now, driver_id, vehicle_id]}, reservation_id) do
    State.reservable?(state, now, driver_id, vehicle_id) and is_binary(reservation_id)
  end

  def postcondition(state, {:call, _, :start_reservation_invalid, [now, driver_id, vehicle_id]}, started) do
    not State.reservable?(state, now, driver_id, vehicle_id) and started == false
  end

  def postcondition(state, {:call, _, :start_reservation_invalid_driver, [now, driver_id, vehicle_id]}, started) do
    not State.reservable?(state, now, driver_id, vehicle_id) and started == false
  end

  def postcondition(state, {:call, _, :start_reservation_unapproved_driver, [now, driver_id, vehicle_id]}, started) do
    not State.reservable?(state, now, driver_id, vehicle_id) and started == false
  end

  def postcondition(state, {:call, _, :start_reservation_invalid_vehicle, [now, driver_id, vehicle_id]}, started) do
    not State.reservable?(state, now, driver_id, vehicle_id) and started == false
  end

  def postcondition(state, {:call, _, :stop_reservation_started, [_now, reservation_id]}, stopped) do
    State.is_reservation_started?(state, reservation_id) and stopped == true
  end

  def postcondition(state, {:call, _, :stop_reservation_stopped, [_now, reservation_id]}, stopped) do
    State.is_reservation_stopped?(state, reservation_id) and stopped == true
  end

  @impl :proper_statem
  def next_state(state, _var, {:call, _, :set_time, [now]}) do
    State.set_time(state, now)
  end

  def next_state(state, id, {:call, _, :add_driver_new, [_now, name]}) do
    State.create_driver(state, id, name)
  end

  def next_state(state, id, {:call, _, :add_vehicle_new, [_now, vin]}) do
    State.create_vehicle(state, id, vin)
  end

  def next_state(state, _var, {:call, _, :approve_driver, [_now, driver_id]}) do
    State.approve_driver(state, driver_id)
  end

  def next_state(state, _var, {:call, _, :suspend_driver, [_now, driver_id]}) do
    State.suspend_driver(state, driver_id)
  end

  def next_state(state, id, {:call, _, :start_reservation_valid, [now, driver_id, vehicle_id]}) do
    State.start_reservation(state, now, id, driver_id, vehicle_id)
  end

  def next_state(state, _var, {:call, _, :start_reservation_invalid, [_now, _driver_id, _vehicle_id]}) do
    state
  end

  def next_state(state, _var, {:call, _, :start_reservation_invalid_driver, [_now, _driver_id, _vehicle_id]}) do
    state
  end

  def next_state(state, _var, {:call, _, :start_reservation_unapproved_driver, [_now, _driver_id, _vehicle_id]}) do
    state
  end

  def next_state(state, _var, {:call, _, :start_reservation_invalid_vehicle, [_now, _driver_id, _vehicle_id]}) do
    state
  end

  def next_state(state, _var, {:call, _, :stop_reservation_started, [now, reservation_id]}) do
    State.stop_reservation(state, now, reservation_id)
  end

  def next_state(state, _var, {:call, _, :stop_reservation_stopped, [_now, _reservation_id]}) do
    state
  end

  ## Generators

  def driver_id(%State{drivers: drivers}) when map_size(drivers) > 0 do
    oneof([_ | _] = Map.keys(drivers))
  end

  def vehicle_id(%State{vehicles: vehicles}) when map_size(vehicles) > 0 do
    oneof([_ | _] = Map.keys(vehicles))
  end

  def available_driver_id(%State{approved: approved, started: started}) do
    excluded_driver_ids = for {_, %{driver_id: driver_id}} <- started, into: [], do: driver_id
    possible_driver_ids = MapSet.to_list(approved)
    oneof([_ | _] = possible_driver_ids -- excluded_driver_ids)
  end

  def unapproved_driver_id(%State{drivers: drivers, approved: approved}) do
    excluded_driver_ids = MapSet.to_list(approved)
    possible_driver_ids = Map.keys(drivers)
    oneof([_ | _] = possible_driver_ids -- excluded_driver_ids)
  end

  def unavailable_driver_id(%State{started: started}) when map_size(started) > 0 do
    unavailable_driver_ids = for {_, %{driver_id: driver_id}} <- started, into: [], do: driver_id
    oneof([_ | _] = unavailable_driver_ids)
  end

  def available_vehicle_id(%State{vehicles: vehicles, started: started}) when map_size(vehicles) > 0 do
    excluded_vehicle_ids = for {_, %{vehicle_id: vehicle_id}} <- started, into: [], do: vehicle_id
    possible_vehicle_ids = Map.keys(vehicles)
    oneof([_ | _] = possible_vehicle_ids -- excluded_vehicle_ids)
  end

  def unavailable_vehicle_id(%State{started: started}) when map_size(started) > 0 do
    unavailable_vehicle_ids = for {_, %{vehicle_id: vehicle_id}} <- started, into: [], do: vehicle_id
    oneof([_ | _] = unavailable_vehicle_ids)
  end

  def started_reservation_id(%State{started: started}) when map_size(started) > 0 do
    oneof([_ | _] = Map.keys(started))
  end

  def stopped_reservation_id(%State{stopped: stopped}) when map_size(stopped) > 0 do
    oneof([_ | _] = Map.keys(stopped))
  end
end
