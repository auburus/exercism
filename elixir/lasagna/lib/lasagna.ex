defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(t) do
    expected_minutes_in_oven() - t
  end

  def preparation_time_in_minutes(n_layers), do: n_layers * 2


  def total_time_in_minutes(n_layers, t) do
    preparation_time_in_minutes(n_layers) + t
  end

  def alarm() do
    "Ding!"
  end
end
