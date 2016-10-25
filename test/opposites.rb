# opposites.rb

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def enter_number
  number = ''
  loop do
    puts ">> Please enter a positive or negative integer:"
    number = gets.chomp
    break if valid_number?(number) || number.to_i > 0
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
  number
end

number_1 = ''
number_2 = ''

loop do
  number_1 = enter_number.to_i
  number_2 = enter_number.to_i
  break if number_1 < 0 || number_2 < 0
  puts ">> Sorry. One integer must be positive, one must be negative."
  puts ">> Please start over."
end

puts "#{number_1} + #{number_2} = #{number_1 + number_2}"
