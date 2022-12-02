defmodule AdventOfCode2022.Day2 do
  defp parse_input() do
    File.stream!(Path.join("data", "day2_1.txt"))
    |> Stream.flat_map(&String.split(&1, "\n", trim: true))
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(&List.to_tuple(&1))
  end

  # A, X -> rock
  # B, Y -> paper
  # C, Z -> scissors

  def rock_paper_scissors_1() do
    parse_input()
    |> Enum.map(&score/1)
    |> Enum.sum()
  end

  # X -> lose
  # Y -> draw
  # Z -> win

  def rock_paper_scissors_2() do
    parse_input()
    |> Enum.map(&choose_guess/1)
    |> Enum.map(&score/1)
    |> Enum.sum()
  end

  defp choose_guess({"A", "X"}), do: {"A", "Z"}
  defp choose_guess({"A", "Y"}), do: {"A", "X"}
  defp choose_guess({"A", "Z"}), do: {"A", "Y"}

  defp choose_guess({"B", "X"}), do: {"B", "X"}
  defp choose_guess({"B", "Y"}), do: {"B", "Y"}
  defp choose_guess({"B", "Z"}), do: {"B", "Z"}

  defp choose_guess({"C", "X"}), do: {"C", "Y"}
  defp choose_guess({"C", "Y"}), do: {"C", "Z"}
  defp choose_guess({"C", "Z"}), do: {"C", "X"}

  defp score({"A", "X"}), do: 1 + 3
  defp score({"A", "Y"}), do: 2 + 6
  defp score({"A", "Z"}), do: 3 + 0

  defp score({"B", "X"}), do: 1 + 0
  defp score({"B", "Y"}), do: 2 + 3
  defp score({"B", "Z"}), do: 3 + 6

  defp score({"C", "X"}), do: 1 + 6
  defp score({"C", "Y"}), do: 2 + 0
  defp score({"C", "Z"}), do: 3 + 3
end
