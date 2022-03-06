defmodule Dominoes do
  @type domino :: {1..6, 1..6}

  @doc """
  chain?/1 takes a list of domino stones and returns boolean indicating if it's
  possible to make a full chain

  We can treat this problem as a graph with the numbers 1-6 as nodes, as the dominos
  as edges, and checking if it is an Eulerian cycle (iff connected graph with no vertices
  of odd degree)
  """
  @spec chain?(dominoes :: [domino]) :: boolean

  def chain?(dominoes) do
    connected?(dominoes) and nodes_degree_even?(dominoes)
  end

  defp connected?([]), do: true
  defp connected?(dominoes), do: connected?(dominoes, [dominoes |> hd |> elem(0)])

  defp connected?(dominoes, []) do
    case dominoes do
      [] -> true
      _ -> false
    end
  end

  defp connected?(dominoes, [x | xs]) do
    dominoes_connected_to_node = dominoes |> Enum.filter(fn {n1, n2} -> n1 == x or n2 == x end)

    new_nodes =
      dominoes_connected_to_node
      |> Enum.map(fn {n1, n2} ->
        cond do
          n1 == x -> n2
          true -> n1
        end
      end)
      |> Enum.sort()
      |> Enum.dedup()

    connected?(dominoes -- dominoes_connected_to_node, xs ++ new_nodes)
  end

  defp nodes_degree_even?(dominoes) do
    dominoes
    |> Enum.reduce(%{}, fn {x, y}, accum ->
      accum |> Map.update(x, 1, &(&1 + 1)) |> Map.update(y, 1, &(&1 + 1))
    end)
    |> Map.values()
    |> Enum.all?(&(rem(&1, 2) == 0))
  end
end
