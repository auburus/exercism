defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2,b2}) do
    {a1*b2 + a2*b1, b1*b2} |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, {b2, a2}) do
    add(a, {-b2, a2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2,b2}) do
    {a1 * a2, b1 * b2} |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, {a2,b2}) do
    multiply(num, {b2, a2})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a,b}) when a >= 0 and b >= 0, do: {a,b} |> reduce()
  def abs({a,b}) when a < 0 and b >= 0, do: {-a,b} |> reduce()
  def abs({a,b}) when a >= 0 and b < 0, do: {a,-b} |> reduce()
  def abs({a,b}) when a < 0 and b < 0, do: {-a,-b} |> reduce()

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a,b}, n) when n>=0 do
    {Integer.pow(a, n), Integer.pow(b,n)} |> normalize()
  end
  def pow_rational({a,b}, n) when n<0 do
    pow_rational({b,a}, -n)
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a,b}) do
    Float.pow(x/1, a/b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a,b}) do
    {div(a, Integer.gcd(a,b)), div(b, Integer.gcd(a,b))} |> normalize()
  end

  defp normalize({a,b}) when b >0, do: {a,b}
  defp normalize({a,b}) when b <0, do: {-a,-b}
end
