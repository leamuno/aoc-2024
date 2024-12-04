def load_word_search(file_path)
  File.readlines(file_path).map { |line| line.strip.chars }
end

def pattern_matches?(grid, i, j, pattern)
  return false if i + 2 >= grid.size || j + 2 >= grid[0].size

  case pattern
  when :type_1
    grid[i][j] == grid[i][j + 2] &&
    grid[i + 1][j + 1] == "A" &&
    grid[i + 2][j] == grid[i + 2][j + 2] &&
    %w[SAM MAS].include?("#{grid[i][j]}#{grid[i + 1][j + 1]}#{grid[i + 2][j]}")
  when :type_2
    grid[i][j] == grid[i + 2][j] &&
    grid[i + 1][j + 1] == "A" &&
    grid[i][j + 2] == grid[i + 2][j + 2] &&
    %w[SAM MAS].include?("#{grid[i][j]}#{grid[i + 1][j + 1]}#{grid[i][j + 2]}")
  else
    false
  end
end

def count_patterns(file_path)
  word_search = load_word_search(file_path)
  count = 0

  word_search.each_with_index do |line, i|
    line.each_with_index do |char, j|
      next unless %w[S M].include?(char)

      count += 1 if pattern_matches?(word_search, i, j, :type_1)
      count += 1 if pattern_matches?(word_search, i, j, :type_2)
    end
  end

  count
end

file_path = "day-4/input.txt"
puts count_patterns(file_path)
