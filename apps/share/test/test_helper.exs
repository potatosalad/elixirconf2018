Application.load(:share)
for app <- Application.spec(:share, :applications), do: Application.ensure_all_started(app)
ExUnit.start(timeout: 3_000_000)
