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
end
