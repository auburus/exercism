defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: do_keep(list, fun, [])
  defp do_keep([], _fun, accum), do: Enum.reverse(accum)
  defp do_keep([x|xs], fun, accum) do
    cond do
      fun.(x) -> do_keep(xs, fun, [x|accum])
      true -> do_keep(xs, fun, accum)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: do_discard(list, fun, [])

  defp do_discard([], _fun, accum), do: Enum.reverse(accum)
  defp do_discard([x|xs], fun, accum) do
    cond do
      not fun.(x) -> do_discard(xs, fun, [x|accum])
      true -> do_discard(xs, fun, accum)
    end
  end
end
