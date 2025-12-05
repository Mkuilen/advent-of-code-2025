input_path = File.expand_path('../inputs/day5.txt', __dir__)
abort("File not found: #{input_path}") unless File.exist?(input_path)
input = File.read(input_path).lines.map(&:chomp)

pattern = /\b(\d+)-(\d+)\b/
ranges = []
fresh = 0
input.each do |range|
  if range =~ pattern
    m = range.match(pattern)
    ranges << [m[1].to_i, m[2].to_i]
  elsif range == ""
    next
  else
    ranges.each do |r|
      if range.to_i.between?(r[0], r[1])
        fresh += 1
        break
      end
    end
  end
end

puts fresh