# calculator.rb
# ask user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'es'

def messages(message, lang)
  MESSAGES[lang][message]
end

def prompt(key)
	message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  word= case op
				  when '1'
				    'Adding'
				  when '2'
				    'Substracting'
				  when '3'
				    'Multiplying'
				  when '4'
				    'Dividing'
				end
	word
end

prompt('welcome')

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt('hello')

loop do
  number1 = nil
  number2 = nil

  loop do
    prompt('first_number')
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt('entre_number_error')
    end
  end

  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt('entre_number_error')
    end
  end

  # ask the user for operation

  prompt('operator_prompt')
	
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
			prompt(" 1, 2, 3 or 4")
		end
	end

	operation_type =operation_to_message(operator)

	prompt('pre_result')

	result = case operator
							when '1'
								number1.to_i() + number2.to_i()
							when '2'
								number1.to_i() - number2.to_i()
							when '3'
								number1.to_i() * number2.to_i()
							when '4'
								number1.to_f() / number2.to_f()
					 end

  prompt("The result for #{operation_to_message(operator).downcase()} is #{result}")

  prompt('next_calculation')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('bye')
