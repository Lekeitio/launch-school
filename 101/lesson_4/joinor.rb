# joinor.rb
=begin
def joinor(arr, sep = ", ", term = "or")
  term = ' ' + term + ' '
  arr.each_with_index do |word, index|
    arr[index] = word.to_s + sep unless index == (arr.size - 1)
    arr[index] = word.to_s + term if index == (arr.size - 2)
  end
  return arr.join
end
=end

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

array = ['a', 2, 3, 4]
puts joinor(array)