# frozen_string_literal: true
input_path = File.expand_path('../inputs/day2.txt', __dir__)
abort("File not found: #{input_path}") unless File.exist?(input_path)
input = File.read(input_path).split(',').map(&:strip)

invalid_ids_sum = 0
input.each do |line|
  part_1, part_2 = line.split("-")
  (part_1.to_i..part_2.to_i).each do |id|
    if id.to_s.match?(/^(\d+)\1+$/) && id.digits.reverse.first != 0
      invalid_ids_sum += id
      print id
      print "\n"
    end
  end
end
print invalid_ids_sum
