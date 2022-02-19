defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      legacy? and level not in [1,2,3,4] -> :unknown
      level == 0 -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 -> :fatal
      true -> :unknown
    end

  end

  def alert_recipient(level, legacy?) do
    l = to_label(level, legacy?)
    cond do
      l in [:error, :fatal] -> :ops
      l == :unknown and legacy? -> :dev1
      l == :unknown and not legacy? -> :dev2
      true -> false
    end
  end
end
