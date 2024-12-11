def evaluate_expression(numbers, operators)
  result = numbers[0]
  operators.each_with_index do |op, i|
    if op == '+'
      result += numbers[i + 1]
    elsif op == '*'
      result *= numbers[i + 1]
    elsif op == '||'
      result = "#{result}#{numbers[i+1]}".to_i
    end
  end
  result
end

def parse_input(input_data)
  equations = []
  input_data.strip.split("\n").each do |line|
    test_value, numbers = line.split(":")
    test_value = test_value.strip.to_i
    numbers = numbers.strip.split.map(&:to_i)
    equations << [test_value, numbers]
  end
  equations
end

def find_valid_equations(equations)
  total_calibration_result = 0

  equations.each do |test_value, numbers|
    n = numbers.length - 1
    valid = false

    ["+", "*", "||"].repeated_permutation(n).each do |operators|
      if evaluate_expression(numbers, operators) == test_value
        valid = true
        break
      end
    end

    total_calibration_result += test_value if valid
  end

  total_calibration_result
end

data = File.read("day-7/input.txt")

puts find_valid_equations(parse_input(data))
