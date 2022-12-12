defmodule AdventOfCode2022.Day5 do
  defp parse_input() do
    File.read!(Path.join("data", "day5_1.txt"))
    |> String.trim()
    |> String.split("\n")
  end

  def supply_stacks_1() do
    [stacks, moves] =
      parse_input()
      |> Enum.chunk_by(fn elt -> elt == "" end)
      |> Enum.filter(fn elt -> elt != [""] end)

    {stacks,moves}

  end
end
