defmodule Advent2022Day2 do
  ## Scores
  # Rock - 1 - AX
  # Paper - 2 - BY
  # Scissors - 3 CZ
  #
  # Win - 6
  # Draw - 3
  # Loss - 0

  def shape_score("X"), do: 1
  def shape_score("Y"), do: 2
  def shape_score("Z"), do: 3

  def outcome_score("A", "X"), do: 3
  def outcome_score("A", "Y"), do: 6
  def outcome_score("A", "Z"), do: 0
  def outcome_score("B", "X"), do: 0
  def outcome_score("B", "Y"), do: 3
  def outcome_score("B", "Z"), do: 6
  def outcome_score("C", "X"), do: 6
  def outcome_score("C", "Y"), do: 0
  def outcome_score("C", "Z"), do: 3

  # Guide
  # X - lose
  # Y - draw
  # Z - win

  def your_play("A", "X"), do: "Z"
  def your_play("A", "Y"), do: "X"
  def your_play("A", "Z"), do: "Y"
  def your_play("B", "X"), do: "X"
  def your_play("B", "Y"), do: "Y"
  def your_play("B", "Z"), do: "Z"
  def your_play("C", "X"), do: "Y"
  def your_play("C", "Y"), do: "Z"
  def your_play("C", "Z"), do: "X"

  def score(opponent, you), do: shape_score(you) + outcome_score(opponent, you) 

  def parse do
    File.stream!('./input.txt', [], :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(fn str -> String.split(str, " ") end)
  end

  def solve do
    {part1(parse()), part2(parse())}
  end

  def part1(stream) do
    stream
    |> Stream.map(fn ([opp, you]) -> score(opp, you) end)
    |> Enum.sum
  end
  def part2(stream) do
    stream
    |> Stream.map(fn ([opp, guide]) -> score(opp, your_play(opp, guide)) end)
    |> Enum.sum
  end
end

{first, second} = Advent2022Day2.solve

IO.puts "Part 1: #{first}"
IO.puts "Part 2: #{second}"
