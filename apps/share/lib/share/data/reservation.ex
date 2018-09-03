defmodule Share.Data.Reservation do
  use Ecto.Schema
  import Ecto.Changeset

  schema("reservations") do
    belongs_to(:driver, Share.Data.Driver)
    belongs_to(:vehicle, Share.Data.Vehicle)
    field(:start, Share.Ecto.Timestamp)
    field(:stop, Share.Ecto.Timestamp)
    timestamps()
  end

  def changeset(struct = %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, [:driver_id, :vehicle_id, :start, :stop])
    |> validate_required([:driver_id, :vehicle_id, :start, :stop])
    |> foreign_key_constraint(:driver_id)
    |> foreign_key_constraint(:vehicle_id)
    |> exclusion_constraint(:driver_id, name: :reservations_no_overlap_driver_id)
    |> exclusion_constraint(:vehicle_id, name: :reservations_no_overlap_vehicle_id)
  end
end
