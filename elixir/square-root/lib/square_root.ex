defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @delta 1/1_000_000_000_000_000

  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    Stream.iterate(1, fn x -> 0.5*(x + (radicand / x)) end)
    |> Stream.drop_while(fn x -> abs(x*x - radicand) > @delta end)
    |> Enum.fetch!(0)
  end
end
