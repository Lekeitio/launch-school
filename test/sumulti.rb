# sumulti.rb

# write a program that asks the user an integer greater than 0. Then asks
# if the user wants to determine the sum or product of all numbers between
# 1 and the number entered.

def prompt(message)
  puts("=> #{message}")
end

def is_bigger_than_cero?(num)
  return false if num <= 0
  true
end

def do_sum(num)
  add_total = 0
  for i in 1..num
    add_total = add_total + i
  end
  return add_total
end

def do_product(num)
  product_total = 1
  for i in 1..num
    product_total = product_total * i
  end
  return product_total
end

number = 0
result = ''

loop do
  prompt('Enter a number integer greater than 0')
  number = (gets.chomp.to_i)
  break if is_bigger_than_cero?(number)
end

prompt("Enter 's' to compute the sum, enter 'p' to compute the product")

loop do
  selection = gets.chomp.downcase

  if selection == 's'
    result = do_sum(number)
    puts ("The sum of the integers between 1 and #{number} is #{result}")
  elsif selection == 'p'
    result = do_product(number)
    puts ("The product of the integers between 1 and #{number} is #{result}")
  else
    prompt ("Incorrect selection, please enter 's' or 'p'")
  end
  break if result != nil
end