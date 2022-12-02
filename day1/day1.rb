input = File.read('./input.txt')

class Calories
  attr_reader :input

  def initialize(input)
    @input = input.split("\n")
  end

  def elves
    index = 0
    input.each_with_object([]) do |item, collection|
      collection[index] = [] unless collection[index]

      if item != ""
        collection[index] << item.to_i
      else
        index += 1
      end
    end
  end

  def max_calories
    elves.map(&:sum).max
  end

  def top_three_calories
    elves.map(&:sum).sort.reverse.take(3).sum
  end
end

cals = Calories.new(input)

puts "Part 1: #{cals.max_calories}"

puts "Part 2: #{cals.top_three_calories}"
