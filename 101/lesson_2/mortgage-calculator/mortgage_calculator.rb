# mortgage_calculator.rb

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

LANGUAGE = 'en'

def messages(message, lang)
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}").to_s.chomp()
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def get_amount(error)
  amount = ''
  loop do
    amount = Kernel.gets().chomp()

    if valid_number?(amount)
      break
    else
      prompt("#{error}")
    end
  end
  amount
end

prompt('welcome')
prompt('name')

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?() || name == ' '
    prompt('valid_name')
  else
    break
  end
end

loop do
  # Get loan amount
  prompt('loan_amount')
  loan_amount = get_amount('invalid_amount')

  # Get APR
  prompt('apr_amount')
  apr_amount = get_amount('invalid_apr')

  monthly_interest_rate = apr_amount.to_f / 12 / 100

  # Get loan duration
  prompt('loan_duration')
  loan_duration = get_amount('invalid_loan_duration')

  loan_amount = loan_amount.to_f()
  monthly_interest_rate = monthly_interest_rate.to_f()
  loan_duration = loan_duration.to_i()

  # Calculate monthly payment

  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-loan_duration))

  final_monthly_payment = format('%02.2f', monthly_payment)

  puts "#{name.capitalize}, #{messages('monthly_payment', LANGUAGE)}#{final_monthly_payment}"

  prompt('another_calculation')
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt('bye')
