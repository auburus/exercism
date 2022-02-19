defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:milliliter, x}), do: {:milliliter, x}
  def to_milliliter({:cup, x}), do: {:milliliter, x*240}
  def to_milliliter({:fluid_ounce, x}), do: {:milliliter, x*30}
  def to_milliliter({:teaspoon, x}), do: {:milliliter, x*5}
  def to_milliliter({:tablespoon, x}), do: {:milliliter, x*15}

  def from_milliliter({:milliliter, x}, :milliliter), do: {:milliliter, x}
  def from_milliliter({:milliliter, x}, :cup), do: {:cup, x/240.0}
  def from_milliliter({:milliliter, x}, :fluid_ounce), do: {:fluid_ounce, x/30.0}
  def from_milliliter({:milliliter, x}, :teaspoon), do: {:teaspoon, x/5.0}
  def from_milliliter({:milliliter, x}, :tablespoon), do: {:tablespoon, x/15.0}

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter |> from_milliliter(unit)
  end
end
