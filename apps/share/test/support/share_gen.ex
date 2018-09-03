defmodule ShareGen do
  use PropCheck

  def year() do
    shrink(range(0, 9999), [range(1970, 2000), range(1900, 2100)])
  end

  def month() do
    range(1, 12)
  end

  def day() do
    range(1, 31)
  end

  def hour() do
    choose(0, 23)
  end

  def minute() do
    choose(0, 59)
  end

  def second() do
    choose(0, 59)
  end

  def date() do
    let(
      date <-
        such_that(
          {y, m, d} <- {year(), month(), day()},
          when: :calendar.valid_date(y, m, d)
        )
    ) do
      Date.from_erl!(date)
    end
  end

  def time() do
    let(time <- {hour(), minute(), second()}) do
      Time.from_erl!(time)
    end
  end

  def naive_datetime() do
    let([d <- date(), t <- time()]) do
      NaiveDateTime.from_erl!({Date.to_erl(d), Time.to_erl(t)})
    end
  end

  def datetime() do
    let(ndt <- naive_datetime()) do
      DateTime.from_naive!(ndt, "Etc/UTC")
    end
  end

  def future_datetime(datetime = %DateTime{}, add_prop) do
    let(add <- add_prop) do
      timestamp = DateTime.to_unix(datetime, :second)
      DateTime.from_unix!(timestamp + add, :second)
    end
  end

  def friendly_unicode() do
    friendly_unicode(255)
  end

  def friendly_unicode(limit) when is_integer(limit) and limit > 0 do
    such_that(s <- utf8(), when: valid_friendly_unicode?(s) and String.length(s) <= limit)
  end

  def driver_name() do
    such_that(s <- friendly_unicode(), when: String.length(String.trim(s)) > 0)
  end

  def vehicle_vin() do
    let(
      l <-
        non_empty(
          list(
            frequency([
              {50, range(?A, ?Z)},
              {50, range(?0, ?9)}
            ])
          )
        )
    ) do
      to_string(l)
    end
  end

  @doc false
  defp valid_friendly_unicode?(iodata) do
    not String.contains?(:unicode.characters_to_binary(iodata), ["_", "%", "\\", <<0>>])
  end
end
