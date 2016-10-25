# loops15.rb

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  # puts names.pop
  puts names.shift
  break if names.empty?
end