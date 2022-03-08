defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number <= 0,
    do: {:error, "Classification is only possible for natural numbers."}

  def classify(number) do
    f = factors(number)

    cond do
      Enum.sum(f) == number -> {:ok, :perfect}
      Enum.sum(f) > number -> {:ok, :abundant}
      Enum.sum(f) < number -> {:ok, :deficient}
    end
  end

  defp factors(n, current \\ 1, factors \\ []) do
    cond do
      current * current > n -> factors |> Enum.filter(&(&1 != n)) |> Enum.sort() |> Enum.dedup()
      rem(n, current) == 0 -> factors(n, current + 1, [div(n, current) | [current | factors]])
      true -> factors(n, current + 1, factors)
    end
  end
end
