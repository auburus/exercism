defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(list(any()), list(any())) :: :equal | :unequal | :sublist | :superlist
  def compare(a, b) do
    cond do
      equal?(a,b) -> :equal
      sublist?(a,b) -> :sublist
      sublist?(b,a) -> :superlist
      true -> :unequal
    end
  end

  defp equal?(as,bs) when length(as) != length(bs), do: false
  defp equal?(as,bs) do
    Stream.zip_with(as, bs, &===/2)
    |> Enum.all?()
  end

  defp sublist?([],_), do: true
  defp sublist?(_, []), do: false
  defp sublist?(a, b) do
    cond do
      length(a) > length(b) -> false
      equal?(a, Enum.take(b, length(a))) -> true
      true -> sublist?(a, tl(b))
    end
  end
end
