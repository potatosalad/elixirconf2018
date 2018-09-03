defmodule Share.Data.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  schema("vehicles") do
    field(:vin, :string)
    timestamps()
    has_many(:reservations, Share.Data.Reservation)
  end

  def changeset(struct = %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, [:vin])
    |> validate_required([:vin])
    |> unique_constraint(:vin)
  end
end
