# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Share.Repo.insert!(%Share.Data.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

driver = Share.Repo.insert!(Share.Data.Driver.changeset(%Share.Data.Driver{}, %{name: "Andrew", approved: true}))
vehicle = Share.Repo.insert!(Share.Data.Vehicle.changeset(%Share.Data.Vehicle{}, %{vin: "1234"}))

reservation =
  Share.Repo.insert!(
    Share.Data.Reservation.changeset(%Share.Data.Reservation{}, %{
      driver_id: driver.id,
      vehicle_id: vehicle.id,
      start: DateTime.utc_now(),
      stop: :infinity
    })
  )
