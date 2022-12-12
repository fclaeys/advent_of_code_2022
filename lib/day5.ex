defmodule AdventOfCode2022.Day5 do
  defp parse_input() do
    File.read!(Path.join("data", "day5_1.txt"))
    |> String.split("\n")
  end

  def supply_stacks_1() do
    [stacks, moves] =
      parse_input()
      |> Enum.chunk_by(fn elt -> elt == "" end)
      |> Enum.filter(fn elt -> elt != [""] end)

    parse_moves(moves)
    |> Enum.reduce(parse_stacks(stacks), &move_1/2)
    |> Map.values()
    |> Enum.map(&List.first/1)
    |> Enum.join()
  end

  def supply_stacks_2() do
    [stacks, moves] =
      parse_input()
      |> Enum.chunk_by(fn elt -> elt == "" end)
      |> Enum.filter(fn elt -> elt != [""] end)

    parse_moves(moves)
    |> Enum.reduce(parse_stacks(stacks), &move_2/2)
    |> Map.values()
    |> Enum.map(&List.first/1)
    |> Enum.join()
  end

  defp move_1(move, stacks) do
    IO.inspect(move)
    [nb_crate, from_stack_index, to_stack_index] = move

    Enum.reduce(1..nb_crate, stacks, fn _, acc ->
      {item, acc} = get_and_update_in(acc, [from_stack_index], fn [h | t] -> {h, t} end)
      update_in(acc, [to_stack_index], fn s -> [item | s] end)
      # IO.inspect(stacks)
    end)
  end

  defp move_2(move, stacks) do
    IO.inspect(move)
    [nb_crate, from_stack_index, to_stack_index] = move

    {items, acc} =
      get_and_update_in(stacks, [from_stack_index], fn s -> Enum.split(s, nb_crate) end)

    update_in(acc, [to_stack_index], fn s -> items ++ s end)
  end

  defp parse_stacks(stacks_input) do
    stacks_input
    |> Enum.drop(-1)
    |> Enum.flat_map(fn line ->
      line |> String.graphemes() |> Enum.drop(1) |> Enum.take_every(4) |> Enum.with_index(1)
    end)
    |> Enum.group_by(&elem(&1, 1))
    |> Enum.map(fn {column, vals} ->
      {column, vals |> Enum.map(&elem(&1, 0)) |> Enum.reject(&Kernel.==(&1, " "))}
    end)
    |> Map.new()

    # number_stacks = String.to_integer(number_stacks)

    # %{1 => ["D", "N", "Z"], 2 => ["C", "M"], 3 => ["P"]}
    # stacks_input
  end

  defp parse_moves(moves_input) do
    moves_input
    |> Enum.map(fn line ->
      line
      |> String.split(["move", "from", "to"], trim: true)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)
    end)

    #  [{1, 2, 1}, {3, 1, 3}, {2, 2, 1}, {1, 1, 2}]

    # moves_input
  end
end
