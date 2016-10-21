# TTT.rb
require 'pry'

START_PLAYER = 'Choose'.freeze
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(mssg)
  puts "=> #{mssg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  prompt "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
  display_one_line
  puts "|  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  |"
  display_three_lines
  puts "|  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  |"
  display_three_lines
  puts "|  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  |"
  display_one_line
  puts ' '
end
# rubocop:enable Metrics/AbcSize

def display_one_line
  puts "|     |     |     |"
end

def display_three_lines
  puts "|     |     |     |"
  puts "+-----+-----+-----+"
  puts "|     |     |     |"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Chose a square (#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  if computer_offense(brd)
    square = computer_offense(brd)
  else
    square = computer_defense(brd)
  end

  if !square && brd[5] == ' '
    return brd[5] = COMPUTER_MARKER
  end

  # pick ramdon square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def computer_defense(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def computer_offense(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def end_game?(score_human, score_computer)
  score_human >= 5 || score_computer >= 5
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def play_player(brd)
  display_board(brd)
  player_places_piece!(brd)
  return true if someone_won?(brd) || board_full?(brd)
end

def play_computer(brd)
  computer_places_piece!(brd)
  display_board(brd)
  return true if someone_won?(brd) || board_full?(brd)
end

def choose_init_player
  system 'clear'
  prompt 'Who starts Human (h) or Computer (c)'
  while selection = gets.chomp
    break if selection.downcase.start_with?('h', 'c')
    prompt 'Enter Human (h) or Computer (c)'
  end
  if selection == 'h'
    return 'Player'
  else
    return 'Computer'
  end
end

def play_game(plr, brd)
  if plr == 'Player'
    return true if play_player(brd)
    return true if play_computer(brd)
  else
    return true if play_computer(brd)
    return true if play_player(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'Player'
    return 'Computer'
  else
    return 'Player'
  end
end

score_human = 0
score_computer = 0
initial_player = START_PLAYER
initial_player = choose_init_player if START_PLAYER == 'Choose'

loop do
  board = initialize_board

  loop do
    break if play_game(initial_player, board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == "Player"
      score_human += 1
    elsif detect_winner(board) == "Computer"
      score_computer += 1
    end
  else
    prompt "It's a tie!"
  end

  prompt "Total result Human: #{score_human} | Computer: #{score_computer}"
  break if end_game?(score_human, score_computer)
  prompt "Play again (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe. Good Bye!"
