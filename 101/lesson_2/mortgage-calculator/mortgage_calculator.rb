# mortgage_calculator.rb

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

LANGUAGE = 'en'

def messages(message, lang)
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
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

prompt('welcome')
prompt('name')

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

loop do
  # Get loan amount
  prompt('loan_amount')
  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()

    if valid_number?(loan_amount)
      break
    else
      prompt('invalid_amount')
    end
  end

  # Get APR
  prompt('apr_amount')
  apr_amount = ''
  loop do
    apr_amount = Kernel.gets().chomp()

    if valid_number?(apr_amount)
      break
    else
      prompt('invalid_apr')
    end
  end

  monthly_interest_rate = apr_amount.to_f / 12 / 100

  # Get loan duration
  prompt('loan_duration')
  loan_duration = ''
  loop do
    loan_duration = Kernel.gets().chomp()

    if valid_number?(loan_duration)
      break
    else
      prompt('invalid_loan_duration')
    end
  end
  loan_amount = loan_amount.to_f()
  monthly_interest_rate = monthly_interest_rate.to_f()
  loan_duration = loan_duration.to_i()

  # Calculate monthly payment

  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-loan_duration))

  final_monthly_payment = format('%02.2f', monthly_payment)

  prompt('monthly_payment')
  puts final_monthly_payment

  prompt('another_calculation')
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt('bye')
