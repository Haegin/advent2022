defmodule Advent2022Day1 do
  def part1(stream), do: List.first(stream)
  def part2(stream), do: Enum.take(stream, 3) |> Enum.sum

  def solve do
    chunk_fn = fn
      ("\n", acc) -> {:cont, acc, []}
      (element, acc) -> {:cont, [elem(Integer.parse(element), 0) | acc]}
    end
    after_fn = fn
      [] -> {:cont, []}
      acc -> {:cont, acc, []}
    end

    elves = File.stream!('./input.txt', [], :line)
    |> Stream.chunk_while([], chunk_fn, after_fn)
    |> Stream.map(&Enum.sum/1)
    |> Enum.sort(:desc)

    {part1(elves), part2(elves)}
  end
end

{first, second} = Advent2022Day1.solve

IO.puts "Part 1: #{first}"
IO.puts "Part 2: #{second}"
