defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    case value(colors) do
      x when x < 1000 -> {x, :ohms}
      x -> {div(x, 1000), :kiloohms}
    end
  end

  @spec value(colors :: [atom]) :: integer
  defp value(colors) do
    values = colors
    |> Enum.take(3)
    |> Enum.map(&code/1)

    (values |> Enum.take(2) |> Integer.undigits()) * Integer.pow(10, Enum.at(values, 2))
  end

  @spec code(atom) :: integer()
  defp code(color) do
    case color do
      :black -> 0
      :brown -> 1
      :red -> 2
      :orange -> 3
      :yellow -> 4
      :green -> 5
      :blue -> 6
      :violet -> 7
      :grey -> 8
      :white -> 9
      true -> :error
    end
  end
end
