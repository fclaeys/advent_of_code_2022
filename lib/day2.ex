defmodule AdventOfCode2022.Day2 do
  # A, X -> rock
  # B, Y -> paper
  # C, Z -> scissors

  def rock_paper_scissors_1() do
    File.stream!(Path.join("data", "day2_1.txt"))
    |> Stream.flat_map(&String.split(&1, "\n", trim: true))
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(&List.to_tuple(&1))
    |> Enum.reduce(0, fn {opp, guess}, acc -> acc + score(opp, guess) end)
  end

  # X -> lose
  # Y -> draw
  # Z -> win

  def rock_paper_scissors_2() do
    File.stream!(Path.join("data", "day2_1.txt"))
    |> Stream.flat_map(&String.split(&1, "\n", trim: true))
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(&List.to_tuple(&1))
    |> Enum.map(fn {opp, outcome} -> {opp, choose_guess(opp, outcome)} end)
    |> Enum.reduce(0, fn {opp, guess}, acc -> acc + score(opp, guess) end)
  end

  defp choose_guess("A", "X"), do: "Z"
  defp choose_guess("A", "Y"), do: "X"
  defp choose_guess("A", "Z"), do: "Y"

  defp choose_guess("B", "X"), do: "X"
  defp choose_guess("B", "Y"), do: "Y"
  defp choose_guess("B", "Z"), do: "Z"

  defp choose_guess("C", "X"), do: "Y"
  defp choose_guess("C", "Y"), do: "Z"
  defp choose_guess("C", "Z"), do: "X"

  defp score("A", "X"), do: 1 + 3
  defp score("A", "Y"), do: 2 + 6
  defp score("A", "Z"), do: 3 + 0

  defp score("B", "X"), do: 1 + 0
  defp score("B", "Y"), do: 2 + 3
  defp score("B", "Z"), do: 3 + 6

  defp score("C", "X"), do: 1 + 6
  defp score("C", "Y"), do: 2 + 0
  defp score("C", "Z"), do: 3 + 3
end
