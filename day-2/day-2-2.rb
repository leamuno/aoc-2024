count = 0

def is_safe(report)
  return false if report != report.sort && report != report.sort.reverse

  report.each_cons(2).all? { |a, b| (1..3).include?((b - a).abs) }
end

def use_dampener(report)
  return true if is_safe(report)

  report.each_with_index do |_, index|
    modified_report = report[0...index] + report[index + 1..-1]
    return true if is_safe(modified_report)
  end

  false
end

File.open("day-2/input.txt").each do |line|
  report = line.split(" ").map(&:to_i)

  count += 1 if use_dampener(report)
end

puts count
