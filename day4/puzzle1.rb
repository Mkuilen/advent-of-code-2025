# frozen_string_literal: true

input_path = File.expand_path('../inputs/day4.txt', __dir__)
abort("File not found: #{input_path}") unless File.exist?(input_path)
input = File.read(input_path).lines.map(&:chomp)
rolls = input.map(&:chars)

toilet_rolls = 0
rolls.each_with_index do |roll, index|
  prev = index.zero? ? nil : rolls[index - 1]
  nxt = index == rolls.length - 1 ? nil : rolls[index + 1]

  for i in 0..roll.length
    rolls_adjacent = []
    if roll[i] == '@'
      rolls_adjacent << roll[i + 1] if i + 1 < roll.length
      rolls_adjacent << roll[i - 1] if i - 1 >= 0
      rolls_adjacent << prev[i] if prev
      rolls_adjacent << prev[i - 1] if prev && i - 1 >= 0
      rolls_adjacent << prev[i + 1] if prev && i + 1 < roll.length
      rolls_adjacent << nxt[i] if nxt
      rolls_adjacent << nxt[i + 1] if nxt && i + 1 < roll.length
      rolls_adjacent << nxt[i - 1] if nxt && i - 1 >= 0
    end
    print rolls_adjacent.inspect
    print "\n"
    if roll[i] == '@' && rolls_adjacent.count('@') < 4
      toilet_rolls += 1
    end
  end
end
print toilet_rolls