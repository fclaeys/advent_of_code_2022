defmodule AdventOfCode2022.Day1 do
  def calorie_counting_1 do
    File.stream!(Path.join("data", "day1_1.txt"))
    |> Stream.map(&String.split(&1, "\n", trim: true))
    |> Enum.chunk_by(&(&1 == []))
    |> Enum.reject(&(&1 == [[]]))
    |> Enum.map(fn elt -> List.flatten(elt) end)
    |> Enum.map(fn elt -> Enum.map(elt, fn x -> String.to_integer(x) end) end)
    |> Enum.map(fn elt -> Enum.reduce(elt, fn x, acc -> x + acc end) end)
    |> Enum.max(fn a, b -> a > b end)
  end

  def calorie_counting_2 do
    File.stream!(Path.join("data", "day1_1.txt"))
    |> Stream.map(&String.split(&1, "\n", trim: true))
    |> Enum.chunk_by(&(&1 == []))
    |> Enum.reject(&(&1 == [[]]))
    |> Enum.map(fn elt -> List.flatten(elt) end)
    |> Enum.map(fn elt -> Enum.map(elt, fn x -> String.to_integer(x) end) end)
    |> Enum.map(fn elt -> Enum.reduce(elt, fn x, acc -> x + acc end) end)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.reduce(fn x, acc -> x + acc end)
  end
end
