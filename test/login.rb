# login.rb

USER = 'admin'
PASSWORD = 'SecreT'

loop do
  puts ">> Entre use name:"
  user_name = gets.chomp

  puts ">> Please enter your password:"
  password = gets.chomp
  
  break if password == PASSWORD && user_name = USER
  puts ">> Invalid user name or password!"
end
puts "Welcome!"