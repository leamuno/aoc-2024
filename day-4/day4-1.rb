def load_word_search(file_path)
  File.readlines(file_path).map { |line| line.strip.chars }
end

def pattern_matches?(grid, i, j, pattern)
  case pattern
  when :type_1
    return false if i + 3 >= grid.size
    %w[S X] == [grid[i][j], grid[i + 3][j]].sort &&
    %w[A M] == [grid[i + 1][j], grid[i + 2][j]].sort &&
    %w[SAMX XMAS].include?("#{grid[i][j]}#{grid[i + 1][j]}#{grid[i + 2][j]}#{grid[i + 3][j]}")
  when :type_2
    return false if j + 3 >= grid[0].size
    %w[S X] == [(grid[i][j]), grid[i][j + 3]].sort &&
    %w[A M] == [(grid[i][j + 1]), grid[i][j + 2]].sort &&
    %w[SAMX XMAS].include?("#{grid[i][j]}#{grid[i][j + 1]}#{grid[i][j + 2]}#{grid[i][j + 3]}")
  when :type_3
    return false if i + 3 >= grid.size || j + 3 >= grid[0].size
    %w[S X] == [(grid[i][j]), grid[i + 3][j + 3]].sort &&
    %w[A M] == [(grid[i + 1][j + 1]), grid[i + 2][j + 2]].sort &&
    %w[SAMX XMAS].include?("#{grid[i][j]}#{grid[i + 1][j + 1]}#{grid[i + 2][j + 2]}#{grid[i + 3][j + 3]}")
  when :type_4
    return false if i + 3 >= grid.size || j - 3 < 0
    %w[S X] == [(grid[i][j]), grid[i + 3][j - 3]].sort &&
    %w[A M] == [(grid[i + 1][j - 1]), grid[i + 2][j - 2]].sort &&
    %w[SAMX XMAS].include?("#{grid[i][j]}#{grid[i + 1][j - 1]}#{grid[i + 2][j - 2]}#{grid[i + 3][j - 3]}")
  else
    false
  end
end

def count_patterns(file_path)
  word_search = load_word_search(file_path)
  count = 0

  word_search.each_with_index do |line, i|
    line.each_with_index do |char, j|
      next unless %w[X S].include?(char)

      count += 1 if pattern_matches?(word_search, i, j, :type_1)
      count += 1 if pattern_matches?(word_search, i, j, :type_2)
      count += 1 if pattern_matches?(word_search, i, j, :type_3)
      count += 1 if pattern_matches?(word_search, i, j, :type_4)
    end
  end

  count
end

file_path = "day-4/input.txt"
p count_patterns(file_path) == 2654
