data = File.open("day-9/input.txt")

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

p arr.join

def compact(arr)
  ind = 0
  l_ind = arr.size - 1

  while ind < l_ind
    if arr[ind] == "."
      arr[ind] = arr[l_ind]
      arr[l_ind] = "."
      l_ind -= 1
      while arr[l_ind] == "."
        l_ind -= 1
        break if ind >= l_ind
      end
    end
    ind += 1
  end
end

compact(arr)

p arr.join

def checksum(arr)
  total = 0
  arr.each_with_index do |num, ind|
    break if num == "."
    total += num.to_i * ind
  end
  return total
end

puts checksum(arr)

data.close
