# frozen_string_literal: true

input_path = File.expand_path('../inputs/day1.txt', __dir__)
abort("File not found: #{input_path}") unless File.exist?(input_path)
input = File.read(input_path).lines.map(&:chomp)
dial_position = 50
number_of_0 = 0

input.each do |line|
  direction, number = line.match(/^([LR])(\d+)$/).captures.tap { |a| a[1] = a[1].to_i }
  x = 0
  if direction == "R"
    while x < number
      dial_position += 1
      if dial_position > 99
        dial_position = 0
      end
      if dial_position == 0
        number_of_0 += 1
      end
      x += 1
    end
  else
    while x < number
      if dial_position < 0
        dial_position = 99
      end
      dial_position -= 1
      if dial_position == 0
        number_of_0 += 1
      end
      x += 1
    end
  end
end

print number_of_0