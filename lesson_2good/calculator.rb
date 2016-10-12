# calculator.rb
# ask user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

#answer = Kernel.gets()
#Kernel.puts(answer)

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's your first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's your second number?")
number2 = Kernel.gets().chomp()

# ask the user for operation
Kernel.puts("What operation do you want to perform?  1 -> Add  2-> Substract 3-> Multiply 4-> Divide")
operator = Kernel.gets().chomp()

if operator == '1'
	operation = "adding"
	result = number1.to_i() + number2.to_i()
elsif operator == '2'
	operation = "substracting"
	result = number1.to_i() - number2.to_i()
elsif operator == '3'
	operation = 'multiplying'
	result = number1.to_i() * number2.to_i()
else
	operation = 'dividing'
	result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result for #{operation} is #{result}")