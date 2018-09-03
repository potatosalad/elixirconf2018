defmodule Share.Repo do
  use Ecto.Repo, otp_app: :share

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    if url = System.get_env("SHARE_DATABASE_URL") do
      {:ok, Keyword.put(opts, :url, url)}
    else
      {:ok, opts}
    end
  end

  if Mix.env() in [:dev, :test] do
    @schemas [
      Share.Data.Reservation,
      Share.Data.Vehicle,
      Share.Data.Driver
    ]

    @spec truncate() :: :ok | {:error, term()}
    def truncate() do
      truncate(@schemas)
    end

    @spec truncate(Ecto.Schema.t() | [Ecto.Schema.t()]) :: :ok | {:error, term()}
    def truncate(schema) when is_atom(schema) do
      table_name = schema.__schema__(:source)

      case query("TRUNCATE #{table_name} CASCADE", []) do
        {:ok, _} ->
          :ok

        error = {:error, _reason} ->
          error
      end
    end

    def truncate(list = [_ | _]) do
      case transaction(fn -> do_truncate_all(list) end) do
        {:ok, result} ->
          result

        error = {:error, _reason} ->
          error
      end
    end

    @doc false
    defp do_truncate_all([]) do
      :ok
    end

    defp do_truncate_all([schema | rest]) when is_atom(schema) do
      case truncate(schema) do
        :ok ->
          do_truncate_all(rest)

        error = {:error, _reason} ->
          error
      end
    end
  end
end
