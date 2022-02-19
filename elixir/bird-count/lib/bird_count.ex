defmodule BirdCount do
  def today([]), do: nil
  def today([x | _]), do: x

  def increment_day_count([]), do: [1]
  def increment_day_count([x |list]), do: [x+1 | list]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | list]), do: has_day_without_birds?(list)

  def total(list), do: total(list, 0)
  defp total([], n), do: n
  defp total([x | list], n), do: total(list, n+x)

  def busy_days(list), do: busy_days(list, 0)
  defp busy_days([], n), do: n
  defp busy_days([x | list], n) do
    cond do
      x >= 5 -> busy_days(list, n+1)
      true -> busy_days(list, n)
    end
  end
end
