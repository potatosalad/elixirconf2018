defmodule Model do
  def smallest(list) when is_list(list) and length(list) > 0 do
    List.first(Enum.sort(list))
  end
end
