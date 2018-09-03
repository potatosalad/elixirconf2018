defmodule Share.Postgrex.Extensions.Timestamp do
  @moduledoc false
  import Postgrex.BinaryUtils, warn: false
  use Postgrex.BinaryExtension, send: "timestamp_send"
  use Bitwise

  @gs_epoch :calendar.datetime_to_gregorian_seconds({{2000, 1, 1}, {0, 0, 0}})
  @max_year 294_276
  @infinity (1 <<< 63) - 1
  @neg_infinity ~~~@infinity

  def init(opts), do: opts

  def encode(_) do
    quote location: :keep do
      timestamp ->
        unquote(__MODULE__).encode!(timestamp)
    end
  end

  def decode(_) do
    quote location: :keep do
      <<8::int32, microsecs::int64>> ->
        unquote(__MODULE__).decode!(microsecs)
    end
  end

  ## Helpers

  def encode!(:infinity) do
    <<8::int32, @infinity::int64>>
  end

  def encode!(:neg_infinity) do
    <<8::int32, @neg_infinity::int64>>
  end

  def encode!({{year, month, day}, {hour, min, sec, usec}})
      when year <= @max_year and hour in 0..23 and min in 0..59 and sec in 0..59 and usec in 0..999_999 do
    datetime = {{year, month, day}, {hour, min, sec}}
    secs = :calendar.datetime_to_gregorian_seconds(datetime) - @gs_epoch
    <<8::int32, secs * 1_000_000 + usec::int64>>
  end

  def encode!(arg) do
    raise ArgumentError, """
    could not encode date/time: #{inspect(arg)}

    This error happens when you are by-passing Ecto's Query API by
    using either Ecto.Adapters.SQL.query/4 or Ecto fragments. This
    makes Ecto unable to properly cast the type. You can fix this by
    explicitly telling Ecto which type to use via `type/2` or by
    implementing the Ecto.DataType protocol for the given value.
    """
  end

  def decode!(@infinity) do
    :infinity
  end

  def decode!(@neg_infinity) do
    :neg_infinity
  end

  def decode!(microsecs) when microsecs < 0 and rem(microsecs, 1_000_000) != 0 do
    secs = div(microsecs, 1_000_000) - 1
    microsecs = 1_000_000 + rem(microsecs, 1_000_000)
    split(secs, microsecs)
  end

  def decode!(microsecs) do
    secs = div(microsecs, 1_000_000)
    microsecs = rem(microsecs, 1_000_000)
    split(secs, microsecs)
  end

  defp split(secs, microsecs) do
    {date, {hour, min, sec}} = :calendar.gregorian_seconds_to_datetime(secs + @gs_epoch)
    {date, {hour, min, sec, microsecs}}
  end
end
