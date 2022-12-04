defmodule AdventOfCode2022.Day4 do
  defp parse_input() do
    File.stream!(Path.join("data", "day4_1.txt"))
    |> Stream.flat_map(&String.split(&1, "\n", trim: true))
    |> Enum.flat_map(&String.split(&1, " "))
    |> Enum.map(&String.split(&1, ","))
    |> Enum.flat_map(fn [assignment_1, assignment_2] ->
      tuple1 =
        assignment_1
        |> String.split("-")

      tuple2 =
        assignment_2
        |> String.split("-")

      [tuple1, tuple2]
    end)
    |> Enum.map(fn [x, y] -> [String.to_integer(x), String.to_integer(y)] end)
    |> Enum.map(&List.to_tuple/1)
    |> Enum.chunk_every(2)
  end

  def camp_cleanup_1() do
    parse_input()
    |> Enum.filter(fn [{a1_1, a1_2}, {a2_1, a2_2}] ->
      cond do
        a1_1 <= a2_1 && a1_2 >= a2_2 -> true
        a2_1 <= a1_1 && a2_2 >= a1_2 -> true
        true -> false
      end
    end)
    |> Enum.count()
  end

  def camp_cleanup_2() do
    parse_input()
    |> Enum.filter(fn [{a1_1, a1_2}, {a2_1, a2_2}] ->
      r1 = Range.new(a1_1, a1_2)
      r2 = Range.new(a2_1, a2_2)

      cond do
        Range.disjoint?(r1, r2) -> false
        true -> true
      end
    end)
    |> Enum.count()
  end
end
