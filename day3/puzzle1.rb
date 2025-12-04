# frozen_string_literal: true
input_path = File.expand_path('../inputs/day3.txt', __dir__)
abort("File not found: #{input_path}") unless File.exist?(input_path)
input = File.read(input_path).lines.map(&:chomp)

final_joltage = 0
input.each do |line|
  int_array = line.split('').map(&:to_i)
  highest_number = 0
  for i in 0...int_array.length
    for j in 1...int_array.length
      if j < int_array.length && i < j
        number = int_array[i].to_s + int_array[j].to_s
        highest_number = number.to_i if number.to_i > highest_number.to_i
      end
    end
  end
  print highest_number
  print "\n"
  final_joltage += highest_number
end

puts final_joltage