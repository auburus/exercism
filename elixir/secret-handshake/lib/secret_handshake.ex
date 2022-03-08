defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code), do: do_commands(code, [])

  defp do_commands(code, acc) do
    cond do
      Bitwise.&&&(code, 0b11111) == 0 -> acc
      Bitwise.&&&(code, 0b1000) > 0 -> do_commands(code - 0b1000, ["jump" | acc])
      Bitwise.&&&(code, 0b100) > 0 -> do_commands(code - 0b100, ["close your eyes" | acc])
      Bitwise.&&&(code, 0b10) > 0 -> do_commands(code - 0b10, ["double blink" | acc])
      Bitwise.&&&(code, 0b1) > 0 -> do_commands(code - 0b1, ["wink" | acc])
      Bitwise.&&&(code, 0b10000) > 0 -> do_commands(code - 0b10000, Enum.reverse(acc))
    end
  end
end
