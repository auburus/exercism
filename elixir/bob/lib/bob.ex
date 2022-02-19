defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input_ = String.trim(input)
    cond do
      String.trim(input_) == "" -> "Fine. Be that way!"
      yelling?(input_) and question?(input_) -> "Calm down, I know what I'm doing!"
      question?(input_) -> "Sure."
      yelling?(input_) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
  defp yelling?(input) do
    String.upcase(input) == input and String.downcase(input) != input
  end
  defp question?(input) do
    String.ends_with?(input, "?")
  end
end
