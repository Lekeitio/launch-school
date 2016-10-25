# lsprint.rb
answer = []

loop do
  loop do
    puts ">> How many output lines do you want? Enter a number >= 3 (Q to quit):"
    answer = gets.chomp
    break if answer.to_i >= 3 || ['q', 'Q'].include?(answer)
    puts ">> That's not enough lines."
  end

  answer.to_i.times do
    puts "Launch School is the best!"
  end

  break if ['q', 'Q'].include?(answer)
end