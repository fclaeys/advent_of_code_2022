defmodule AdventOfCode2022.Day6 do
  def tuning_trouble_1() do
    File.read!(Path.join("data", "day6_1.txt"))
    |> String.graphemes()
    |> analyse_datastream(0)
  end

  defp analyse_datastream(datastream, cpt) do
    characters =
      datastream
      |> Enum.chunk_every(4)
      |> Enum.take(1)

    case is_maker(characters) do
      {true, char_count} ->
        cpt + char_count

      {false, _} ->
        [_ | to_analyse] = datastream
        analyse_datastream(to_analyse, cpt + 4)
    end
  end

  defp is_maker([characters]) when length(characters) == 4 do
    result =
      characters
      |> Enum.group_by(fn c -> c end)
      |> Map.values()
      |> Enum.filter(fn x -> length(x) > 1 end)

    if length(result) > 0 do
      {false, 4}
    else
      [c | _] = result

      {true, Enum.find_index(characters, fn char -> char == c end)}
    end
  end
end
