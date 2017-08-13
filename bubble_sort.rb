def bubble_sort param
  bubble_sort_by(param) { |left, right| left - right }
end

def bubble_sort_by param, &block
  arr = param

  (arr.length - 1).times do
    (arr.length - 1).times do |index|
      if yield(arr[index], arr[index + 1]) > 0
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
      end
    end
  end

  arr
end

puts bubble_sort([3,2,1,5]).inspect
puts bubble_sort_by(["hello", "hi", "amen"]) { |left, right|
  left.length - right.length }.inspect
