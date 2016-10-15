# interleave.rb

def interleave(first_array, second_array)
  result=[]
  length = first_array.size
  length.times do |i|
    result << first_array[i]
    result << second_array[i]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
p [1, 2, 3].zip(['a', 'b', 'c']).flatten