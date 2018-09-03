defmodule Share.Repo.Migrations.Setup do
  use Ecto.Migration

  def change() do
    execute(~s|CREATE EXTENSION IF NOT EXISTS "btree_gist"|, ~s|DROP EXTENSION IF EXISTS "btree_gist"|)

    create table(:drivers) do
      add(:name, :text, null: false)
      add(:approved, :boolean, null: false, default: false)
      timestamps(type: :timestamp, default: fragment("now()"))
    end

    create table(:vehicles) do
      add(:vin, :text, null: false)
      timestamps(type: :timestamp, default: fragment("now()"))
    end

    create(unique_index(:vehicles, [:vin]))

    create table(:reservations) do
      add(:driver_id, references(:drivers, type: :integer, on_delete: :delete_all), null: false)
      add(:vehicle_id, references(:vehicles, type: :integer, on_delete: :delete_all), null: false)
      add(:start, :"timestamp without time zone", null: false)
      add(:stop, :"timestamp without time zone", null: false)
      timestamps(type: :timestamp, default: fragment("now()"))
    end

    create(
      constraint(
        :reservations,
        :reservations_no_overlap_driver_id,
        exclude: ~s|GIST ("driver_id" WITH =, tsrange("start", "stop", '[)') WITH &&)|
      )
    )

    create(
      constraint(
        :reservations,
        :reservations_no_overlap_vehicle_id,
        exclude: ~s|GIST ("vehicle_id" WITH =, tsrange("start", "stop", '[)') WITH &&)|
      )
    )
  end
end
