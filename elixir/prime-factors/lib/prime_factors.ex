defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    do_factors_for(
      number,
      Stream.iterate(2, &(&1 + 1)) |> Stream.take_while(fn x -> x * x <= number end),
      []
    )
  end

  defp do_factors_for(1, _, factors), do: Enum.reverse(factors)

  defp do_factors_for(number, candidates, factors) do
    case Enum.fetch(candidates, 0) do
      :error ->
        do_factors_for(1, candidates, [number | factors])

      {:ok, c} ->
        cond do
          rem(number, c) == 0 ->
            do_factors_for(div(number, c), [c | candidates], [c | factors])

          true ->
            new_candidates =
              candidates
              |> Enum.take_while(fn x -> x * x <= number end)
              |> Enum.filter(fn x -> rem(x, c) != 0 end)

            do_factors_for(number, new_candidates, factors)
        end
    end
  end
end
