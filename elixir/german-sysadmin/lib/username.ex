defmodule Username do
  def sanitize(chars), do: sanitize(chars, [])
  defp sanitize([], sanitized), do: sanitized
  defp sanitize([c | chars], sanitized) do
    case c do
      c when c not in 'abcdefghijklmnopqrstuvwxyz_äöüß' -> sanitize(chars, sanitized)
      ?ä -> sanitize(chars, sanitized ++ 'ae')
      ?ö -> sanitize(chars, sanitized ++ 'oe')
      ?ü -> sanitize(chars, sanitized ++ 'ue')
      ?ß -> sanitize(chars, sanitized ++ 'ss')
      _ -> sanitize(chars, sanitized ++ [c])
    end
  end
end
