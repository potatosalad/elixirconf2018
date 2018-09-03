defmodule Share.Data.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema("drivers") do
    field(:name, :string)
    field(:approved, :boolean, default: false)
    timestamps()
    has_many(:reservations, Share.Data.Reservation)
  end

  def changeset(struct = %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, [:name, :approved])
    |> validate_required([:name, :approved])
  end
end
