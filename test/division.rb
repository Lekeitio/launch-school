# division.rb

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = ''
loop do
  puts ">> Please enter the numerator:"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts ">> Invalid input. Only integers are allowed."
end

denominator = ''
loop do
  puts ">> Please enter the denominator:"
  denominator = gets.chomp
  break if valid_number?(denominator) && denominator.to_i > 0
  puts denominator.to_i == 0 ? ">> Invalid input. A denominator of 0 is not allowed." : ">> Invalid input. Only integers are allowed."
end

puts "#{numerator} / #{denominator} is #{numerator.to_i/denominator.to_i}"

