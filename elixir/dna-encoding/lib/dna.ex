defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna), do: do_encode(dna, <<0::0>>)
  defp do_encode([], encoded), do: encoded
  defp do_encode([x | xs], encoded) do
    do_encode(xs, << encoded::bitstring, << encode_nucleotide(x)::4 >> >>)
  end

  def decode(dna), do: do_decode(dna, '')

  defp do_decode(<<_::0>>, decoded), do: decoded
  defp do_decode(<< x::4, xs::bitstring>>, decoded) do
    do_decode(xs, decoded ++ [decode_nucleotide(x)])
  end
end
