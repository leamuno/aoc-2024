instructions = []
updates = []
parsing_rules = true

File.readlines("day-5/input.txt").each do |line|
  if line.strip.empty?
    parsing_rules = false
    next
  end

  if parsing_rules
    instructions << line.strip.split("|")
  else
    updates << line.strip.split(",")
  end
end

dependencies = {}
instructions.each do |rule|
  x, y = rule
  dependencies[x] ||= []
  dependencies[x] << y
end

def valid_order?(update, dependencies)
  indices = update.each_with_index.to_h
  dependencies.each do |x, ys|
    next unless indices.key?(x)
    ys.each do |y|
      return false if indices.key?(y) && indices[x] > indices[y]
    end
  end
  true
end

total = 0
updates.each do |update|
  if valid_order?(update, dependencies)
    middle_index = update.size / 2
    total += update[middle_index].to_i
  end
end

puts total
