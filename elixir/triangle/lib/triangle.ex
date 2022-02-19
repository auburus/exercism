defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    cond do
      a <= 0 or b <= 0 or c <= 0 -> {:error, "all side lengths must be positive"}
      not triangle?(a,b,c) -> {:error, "side lengths violate triangle inequality"}
      a == b and b == c -> {:ok, :equilateral}
      a + b == c or b + c == a or c + a == b -> {:ok, :degenerate}
      a == b or b == c or c == a -> {:ok, :isosceles}
      true -> {:ok, :scalene}
    end

  end

  defp triangle?(a,b,c) do
    cond do
      a + b < c -> false
      b + c < a -> false
      c + a < b -> false
      true -> true
    end
  end
end
