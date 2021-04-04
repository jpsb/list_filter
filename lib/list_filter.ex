require Integer

defmodule ListFilter do
  def call(list) do
    list
    |> Enum.reduce([], fn elem, acc ->
      filter_integer_odd(acc, Integer.parse(elem))
    end)
    |> Enum.count()
  end

  defp filter_integer_odd(acc, {value, _}), do: add(acc, value)
  defp filter_integer_odd(acc, :error), do: acc

  defp add(acc, value) when Integer.is_even(value), do: acc
  defp add(acc, value) when Integer.is_odd(value), do: acc ++ [value]
end
