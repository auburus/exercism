defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(&(&1[:price]), :asc)
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&(&1[:price] == nil))
  end

  def increase_quantity(item, count) do
    item
    |> Map.update!(:quantity_by_size, fn quantity_by_size ->
      quantity_by_size
      |> Enum.map(fn {k, v} -> {k, v + count} end)
      |> Map.new()
    end)
  end

  def total_quantity(item) do
    item[:quantity_by_size]
    |> Enum.reduce(0, fn {_k,v}, acc -> acc + v end)
  end
end
