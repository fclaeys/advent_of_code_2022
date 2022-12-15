defmodule AdventOfCode2022.Day6 do
  def tuning_trouble_1() do
    File.read!(Path.join("data", "day6_1.txt"))
    |> String.graphemes()
    |> analyse_datastream_1(4)
  end

  def tuning_trouble_2() do
    File.read!(Path.join("data", "day6_1.txt"))
    |> String.graphemes()
    |> analyse_datastream_2(14)
  end

  defp analyse_datastream_1(datastream, cpt) do
    characters =
      datastream
      |> Enum.chunk_every(4)
      |> Enum.take(1)

    IO.inspect(characters)

    case is_maker(characters) do
      {true, char_count} ->
        cpt + char_count

      {false, _} ->
        [_ | to_analyse] = datastream
        analyse_datastream_1(to_analyse, cpt + 1)
    end
  end

  defp analyse_datastream_2(datastream, cpt) do
    characters =
      datastream
      |> Enum.chunk_every(14)
      |> Enum.take(1)

    IO.inspect(characters)

    case is_maker(characters) do
      {true, char_count} ->
        cpt + char_count

      {false, _} ->
        [_ | to_analyse] = datastream
        analyse_datastream_2(to_analyse, cpt + 1)
    end
  end

  defp is_maker([characters]) when length(characters) == 14 do
    result =
      characters
      |> Enum.group_by(fn c -> c end)
      |> Map.values()
      |> Enum.filter(fn x -> length(x) > 1 end)

    # IO.inspect(result)

    if length(result) > 0 do
      {false, 1}
    else
      # trouver le dernier index du caractere qui se repete

      {true, 0}
    end
  end

  defp is_maker([characters]) when length(characters) == 4 do
    result =
      characters
      |> Enum.group_by(fn c -> c end)
      |> Map.values()
      |> Enum.filter(fn x -> length(x) > 1 end)

    # IO.inspect(result)

    if length(result) > 0 do
      {false, 1}
    else
      # trouver le dernier index du caractere qui se repete

      {true, 0}
    end
  end
end
