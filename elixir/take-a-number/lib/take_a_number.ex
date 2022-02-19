defmodule TakeANumber do
  def start() do
    spawn(&loop/0)
  end

  defp loop(n \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, n)
        loop(n)
      {:take_a_number, sender_pid} ->
        send(sender_pid, n+1)
        loop(n+1)
      :stop -> :ok
      _ -> loop(n)
    end
  end
end
