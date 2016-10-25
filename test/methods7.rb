 # methods7.rb

def add(value1, value2)
  value1 + value2
end

def multiply(value1, value2)
  value1 * value2
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
