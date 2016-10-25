# loops9.rb

friends = ['Sarah', 'John', 'Hannah', 'Dave']
for i in 0..(friends.size - 1)
  puts "Hello, " + friends[i]
end

for friend in friends
  puts "Hello, #{friend}!"
end