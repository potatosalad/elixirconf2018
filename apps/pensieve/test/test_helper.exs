Application.load(:pensieve)
for app <- Application.spec(:pensieve, :applications), do: Application.ensure_all_started(app)
ExUnit.start(timeout: 300_000)
