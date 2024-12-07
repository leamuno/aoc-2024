list1 = []
list2 = []
File.open("day-1/input.txt").each do |line|
  line = line.split("   ")
  list1 << line[0].to_i
  list2 << line[1].to_i
end

total = 0

list1.each do |num|
  count = 0
  list2.each do |digit|
    count += 1 if digit == num
  end
  total += count * num
end

puts total
