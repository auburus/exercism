defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: flatten(list, [])
  defp flatten([], accum), do: Enum.reverse(accum)
  defp flatten([x | xs], accum) do
    case x do
      nil -> flatten(xs, accum)
      x when is_list(x) -> flatten(x ++ xs, accum)
      x -> flatten(xs, [x | accum])
    end
  end
end
