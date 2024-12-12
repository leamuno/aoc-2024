data = File.open("day-9/test.txt")

arr = []


def parse(data, arr)
  ind = 0
  for num in 0..data.size - 2 do
    current_num = data.sysread(1).to_i
    if num % 2 == 0
      current_num.times do
        arr << ind
      end
      ind += 1
    else
      current_num.times do
        arr << "."
      end
    end
  end
end

parse(data, arr)

def compact(arr, endp)
  startp = endp - 1
  val = arr[endp]

  while val == arr[startp]
    break if startp == 0 || val != arr[startp]
    startp -= 1
  end
  len = endp - startp
  count = 0
  arr.each_with_index do |num, ind|
    break if ind == startp
    if num != "."
      count = 0
    else
      count += 1
      if count == len
        s = ind - len
        return [arr[0..s] + arr[startp+1..endp] + arr[ind+1..startp] + Array.new(count) {|i| "." } + arr[endp+1..], startp]
      end
    end
  end
  return [arr, startp]
end

endp = arr.size - 1
val = Float::INFINITY
help = 0
while val != 0
  current_val = arr[endp]
  if current_val != "." && val > current_val.to_i
    val = arr[endp].to_i
    results = compact(arr, endp)
    arr = results[0]
    endp = results[1]
    puts "loop #{help} val #{val}"
  else
    endp -= 1
  end
  help += 1
end

p arr

def checksum(arr)
  total = 0
  arr.each_with_index do |num, ind|
    next if num == "."
    total += num.to_i * ind
  end
  return total
end

puts checksum(arr)

data.close
