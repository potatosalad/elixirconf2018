defmodule Share.Ecto.Timestamp do
  @behaviour Ecto.Type

  @impl Ecto.Type
  def type() do
    :"timestamp without time zone"
  end

  @impl Ecto.Type
  def load(term) when term in [:infinity, :neg_infinity] do
    {:ok, term}
  end

  def load(term) do
    Ecto.Type.load(:naive_datetime, term)
  end

  @impl Ecto.Type
  def dump(term) when term in [:infinity, :neg_infinity] do
    {:ok, term}
  end

  def dump(term) do
    Ecto.Type.dump(:naive_datetime, term)
  end

  @impl Ecto.Type
  def cast(term) when term in [:infinity, :neg_infinity] do
    {:ok, term}
  end

  def cast(term) do
    Ecto.Type.cast(:naive_datetime, term)
  end
end
