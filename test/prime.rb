# prime.rb

# program to know if a number is prime, without using prime class

def prime?(number)
  return false if number == 1

  (2..(number - 1)).each do |n|
    return false if (number % n) == 0
  end
  true
end

def select_primes(array)
  array.select { |value| prime?(value)}
end

def count_primes(array)
  array.count { |value| prime?(value)}
end

# write a method that will take an array of numbers and only return those that are prime

# select_primes([1, 2, 3, 4]) => [2, 3]
# select_primes([4, 6, 8, 10]) => []


p select_primes([1, 2, 3, 4])
p select_primes([4, 6, 8, 10, 12])

# count primes in an array

puts count_primes([1, 2, 3, 4])
puts count_primes([4, 6, 8, 10])
