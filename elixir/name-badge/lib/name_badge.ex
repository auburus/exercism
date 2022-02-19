defmodule NameBadge do
  def print(id, name, department) do

    department_ = if department != nil, do: department, else: "owner"
    output = "#{name} - #{String.upcase(department_)}"
    if id != nil do
      "[#{id}] - " <> output
    else
      output
    end
  end
end
