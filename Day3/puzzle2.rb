# frozen_string_literal: true
input_path = File.expand_path('../inputs/day3.txt', __dir__)
abort("File not found: #{input_path}") unless File.exist?(input_path)
input = File.read(input_path).lines.map(&:chomp)

final_joltage = 0
targets_digits = 12
input.each do |line|
  int_array = line.split('').map(&:to_i)
  highest_number = []
  int_array.each_with_index do |number, index|
    remaining = int_array.length - index - 1
    while highest_number.any? &&
          highest_number.last < number &&
          (highest_number.length + remaining) >= targets_digits
      highest_number.pop
    end
    highest_number << number if highest_number.length < targets_digits
  end
  joltage = '0'
  highest_number.each do |jolt|
    joltage += jolt.to_s
  end
  final_joltage += joltage.to_i
end

puts final_joltage