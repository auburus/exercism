defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(numbers, key) when key < elem(numbers, 0), do: :not_found
  def search(numbers, key) when key > elem(numbers, tuple_size(numbers)-1), do: :not_found
  def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers)-1)
  defp search(numbers, key, l, r) do
    mid = floor((l+r) / 2)
    cond do
      elem(numbers, mid) == key -> {:ok, mid}
      elem(numbers, r) == key -> {:ok, r}
      l == r -> :not_found
      l+1 == r -> :not_found
      key > elem(numbers, mid) -> search(numbers, key, mid, r)
      true -> search(numbers, key, l, mid)
    end
  end
end
