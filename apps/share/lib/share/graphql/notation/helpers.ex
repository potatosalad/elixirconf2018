defmodule Share.GraphQL.Notation.Helpers do
  def ecto_changeset_errors(changeset = %Ecto.Changeset{}, _info = %Absinthe.Resolution{adapter: adapter}) do
    Enum.flat_map(Ecto.Changeset.traverse_errors(changeset, &ecto_changeset_msg_func/1), fn {field, messages} ->
      name = adapter.to_external_name(to_string(field), :field)

      for message <- messages, into: [] do
        %{message: "#{name} #{message}"}
      end
    end)
  end

  @doc false
  defp ecto_changeset_msg_func({msg, opts}) do
    Enum.reduce(opts, msg, &ecto_changeset_msg_func/2)
  end

  @doc false
  defp ecto_changeset_msg_func({key, value}, acc) do
    String.replace(acc, "%{#{key}}", to_string(value))
  end

  def parse_node_ids(resolver, rules) when is_function(resolver, 2) do
    fn args, info ->
      case Absinthe.Relay.Node.ParseIDs.parse(args, rules, info) do
        {:ok, parsed_args} ->
          resolver.(parsed_args, info)

        error ->
          error
      end
    end
  end

  def parse_node_ids(resolver, rules) when is_function(resolver, 3) do
    fn parent, args, info ->
      case Absinthe.Relay.Node.ParseIDs.parse(args, rules, info) do
        {:ok, parsed_args} ->
          resolver.(parent, parsed_args, info)

        error ->
          error
      end
    end
  end
end
