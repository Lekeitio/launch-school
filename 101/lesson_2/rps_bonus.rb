# rps_bonus.rb
VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_MATRIX = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(paper spock),
  'spock' => %w(scissors rock)
}

def replace_choice(choice)
  case choice
  when 'r', 'rock' then 'rock'
  when 'p', 'paper' then 'paper'
  when 's', 'scissors' then 'scissors'
  when 'l', 'lizard' then 'lizard'
  when 'sp', 'spock' then 'spock'
  end
end

def win?(first, second)
  WINNING_MATRIX[first].include?(second)
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def clear_screen
  puts "\e[H\e[2J"
end

def display_result(human, computer)
  if win?(human, computer)
    "You won!"
  elsif win?(computer, human)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def end_game?(sc_hu, sc_co)
  if sc_hu >= 5
    true
  elsif sc_co >= 5
    true
  end
end

def display_current_score(sc_hu, sc_co)
  prompt("Human score is; #{sc_hu}, Computer score is: #{sc_co}")
end

def display_end_game(sc_hu, sc_co)
  clear_screen()
  display_stars()
  prompt("Final score is Human #{sc_hu} and Computer #{sc_co}")
  if sc_hu > sc_co
    prompt("Human won to Computer")
  else
    prompt("Computer won to Human")
  end
  prompt("Thank you for playing, Good Bye")
  display_stars()
end

def display_stars
  prompt("")
  prompt("**************************************************")
  prompt("")
end

reduce_choice = <<-MSG
  Please use :
  r => rock
  p => paper
  s => scissors
  l => lizard
  sp => spock
  MSG

score_human = 0
score_computer = 0

clear_screen()

loop do
  human_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt(reduce_choice)
    choice = Kernel.gets().chomp()
    human_choice = replace_choice(choice)

    if VALID_CHOICES.include?(human_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{human_choice}; Computer chose: #{computer_choice}")

  prompt(display_result(human_choice, computer_choice))
  if display_result(human_choice, computer_choice) == "You won!"
    score_human += 1
  elsif display_result(human_choice, computer_choice) == "Computer won!"
    score_computer += 1
  end

  display_current_score(score_human, score_computer)

  break if end_game?(score_human, score_computer)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
  clear_screen
end

display_end_game(score_human, score_computer)
