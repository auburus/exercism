defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {:emptylist}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    {elem, list}
  end

  @doc """
  Counts the number of elements in a LinkedList
  """
  @spec count(t) :: non_neg_integer()
  def count(list), do: do_count(list, 0)
  defp do_count(list, n) do
    case list do
      {:emptylist} -> n
      {_, list} -> do_count(list, n+1)
    end
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    case list do
      {:emptylist} -> true
      _ -> false
    end
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list) do
    case list do
      {:emptylist} -> {:error, :empty_list}
      {value, _} -> {:ok ,value}
    end
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(list) do
    case list do
      {:emptylist} -> {:error, :empty_list}
      {_, next} -> {:ok, next}
    end
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(list) do
    case list do
      {:emptylist} -> {:error, :empty_list}
      {current, next} -> {:ok, current, next}
    end
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list), do: do_from_list(list, new())
  defp do_from_list([], list_), do: reverse(list_)
  defp do_from_list([x|xs], list_), do: do_from_list(xs, push(list_, x))

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list), do: do_to_list(reverse(list), [])
  defp do_to_list(list_, list) do
    case list_ do
      {:emptylist} -> list
      {current, next} -> do_to_list(next, [current| list])
    end
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list), do: do_reverse(list, new())
  defp do_reverse(list, list_) do
    case list do
      {:emptylist} -> list_
      {current, next} -> do_reverse(next, push(list_, current))
    end
  end
end
