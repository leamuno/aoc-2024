require 'set'

DIR = { ">" => [0, 1], "<" => [0, -1], "v" => [1, 0], "^" => [-1, 0] }
TURN = { ">" => "v", "<" => "^", "v" => "<", "^" => ">" }

def follow_path(grid, pos, obstructed_pos = nil)
  visited = Set.new
  char = grid[pos]

  while grid[pos] != nil
    return false if visited.include?([pos, char])
    visited << [pos, char]

    next_pos = DIR[char].zip(pos).map(&:sum)
    while grid[next_pos] == "#" || next_pos == obstructed_pos
      char = TURN[char]
      next_pos = DIR[char].zip(pos).map(&:sum)
    end

    pos = next_pos
  end

  visited.map(&:first).uniq
end

def results(data)
  start_pos, = data.select { |_k, v| DIR.keys.include?(v) }.first

  follow_path(data, start_pos.dup).count do |test_pos|
    next false if test_pos == start_pos
    follow_path(data, start_pos, test_pos) == false
  end
end

def process_dataset(set)
  grid = {}
  set.each_with_index do |line, y|
    line.chars.each_with_index do |c, x|
      grid[[y, x]] = c
    end
  end
  grid
end

dataset = File.read("day-6/input.txt").split("\n")

data = process_dataset(dataset)

puts results(data)
