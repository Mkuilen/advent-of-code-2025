input_path = File.expand_path('../inputs/day5.txt', __dir__)
abort("File not found: #{input_path}") unless File.exist?(input_path)
input = File.read(input_path).lines.map(&:chomp)

pattern = /\b(\d+)-(\d+)\b/
fresh_ids = []
input.each do |range|
  next unless range =~ pattern
  m = range.match(pattern)
  fresh_ids << (m[1].to_i..m[2].to_i)
end

sorted = fresh_ids.sort_by(&:begin)
merged = [sorted.first]

sorted[1..].each do |r|
  last = merged[-1]
  if r.begin <= last.end + 1
    merged[-1] = (last.begin..[last.end, r.end].max)
  else
    merged << r
  end
end

puts merged.sum { |r| r.end - r.begin + 1 }