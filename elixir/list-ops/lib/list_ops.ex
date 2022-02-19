defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: do_count(l, 0)
  defp do_count([], n), do: n
  defp do_count([_|xs], n), do: do_count(xs, n+1)

  @spec reverse(list) :: list
  def reverse(l), do: do_reverse(l, [])
  defp do_reverse([], ys), do: ys
  defp do_reverse([x|xs], ys), do: do_reverse(xs, [x|ys])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: do_map(l,f, [])
  defp do_map([], _f, ys), do: reverse(ys)
  defp do_map([x|xs], f, ys), do: do_map(xs, f, [f.(x) | ys])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: do_filter(l,f, [])
  defp do_filter([], _f, ys), do: reverse(ys)
  defp do_filter([x|xs], f, ys) do
    cond do
      f.(x) -> do_filter(xs, f, [x|ys])
      true -> do_filter(xs, f, ys)
    end
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _f), do: acc
  def foldl([x|xs], acc, f), do: foldl(xs, f.(x, acc), f)

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f), do: foldl(reverse(l), acc, f)

  @spec append(list, list) :: list
  def append(a, b), do: do_append(reverse(a), b)
  defp do_append([], ys), do: ys
  defp do_append([x|xs], ys), do: do_append(xs, [x|ys])

  @spec concat([[any]]) :: [any]
  def concat(ll), do: do_concat(reverse(ll), [])
  defp do_concat([], ys), do: ys
  defp do_concat([x|xs], ys), do: do_concat(xs, append(x, ys))
end
