data = File.read("day-3/input.txt")

matches = data.scan(/(do\(\))?\s*(don't\(\))?(mul\(\d\d?\d?,\d\d?\d?\))?/)
matches = matches.flatten.reject { |str| str == nil}
total = 0
enabled = true
matches.each do |match|
  enabled = false if match == "don't()"
  if match == "do()"
    enabled = true
    next
  end
  if enabled
    nums = match.scan(/\d\d?\d?/)
    total += nums[0].to_i * nums[1].to_i
  end
end

puts total
