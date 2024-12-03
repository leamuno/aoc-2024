data = File.read("day-3/input.txt")

matches = data.scan(/mul\(\d\d?\d?,\d\d?\d?\)/)

total = 0

matches.each do |match|
  nums = match.scan(/\d\d?\d?/)
  total += nums[0].to_i * nums[1].to_i
end

puts total
