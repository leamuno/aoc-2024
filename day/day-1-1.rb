list1 = []
list2 = []
File.open("day-1/input.txt").each do |line|
  line = line.split("   ")
  list1 << line[0].to_i
  list2 << line[1].to_i
end
list1.sort!
list2.sort!

total = 0

list1.each_with_index do |num, i|
  total += (num - list2[i]).abs
end

puts total
