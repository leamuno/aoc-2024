count = 0

def is_safe(report)
  return false if report != report.sort && report != report.sort.reverse

  report.each_cons(2).all? { |a, b| (1..3).include?((b - a).abs) }
end

File.open("day-2/input.txt").each do |line|
  report = line.split(" ").map(&:to_i)

  count += 1 if is_safe(report)
end




puts count
