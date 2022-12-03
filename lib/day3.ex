defmodule AdventOfCode2022.Day3 do
  @items "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

  defp parse_input() do
    File.stream!(Path.join("data", "day3_1.txt"))
    |> Stream.flat_map(&String.split(&1, "\n", trim: true))
    |> Enum.flat_map(&String.split(&1, " "))
  end

  def rucksack_reorganisation_1 do
    parse_input()
    |> Enum.map(fn elt ->
      chars =
        elt
        |> String.codepoints()

      chars
      |> Enum.chunk_every(div(length(chars), 2))
    end)
    |> Enum.map(fn [first, second] ->
      MapSet.intersection(MapSet.new(first), MapSet.new(second))
    end)
    |> Enum.flat_map(&MapSet.to_list/1)
    |> Enum.map(fn elt ->
      case String.split(@items, elt, parts: 2) do
        [left, _] -> String.length(left) + 1
        [] -> nil
      end
    end)
    |> Enum.sum()
  end

  def rucksack_reorganisation_2 do
    parse_input()
    |> Enum.chunk_every(3)
    |> Enum.map(fn [first, second, third] ->
      common =
        MapSet.intersection(
          MapSet.new(String.codepoints(first)),
          MapSet.new(String.codepoints(second))
        )

      MapSet.intersection(common, MapSet.new(String.codepoints(third)))
    end)
    |> Enum.flat_map(&MapSet.to_list/1)
    |> Enum.map(fn elt ->
      case String.split(@items, elt, parts: 2) do
        [left, _] -> String.length(left) + 1
        [] -> nil
      end
    end)
    |> Enum.sum()
  end
end
