Application.load(:example)
for app <- Application.spec(:example, :applications), do: Application.ensure_all_started(app)
ExUnit.start(timeout: 300_000)
