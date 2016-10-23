# twenty_one.rb

# initial value
DECK_VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
DECK_SUITES = %w(♥ ♣ ♠ ♦).freeze
DECK = DECK_VALUES.product(DECK_SUITES)
NUMBER_DECKS = 1
CARD_HIDE = 0
WINNIG_POINTS = 2
GAME_POINTS = 21
DEALER_MAX = 17

def shuffle_deck
  deck = []
  NUMBER_DECKS.times do
    deck = deck.concat(DECK)
  end
  deck = deck.shuffle
end

def show_play_table(player_hand, dealer_hand)
  player = show_cards_table(player_hand, 'Player')
  dealer = show_cards_table(dealer_hand, 'Dealer')
  clear_screen
  puts " "
  puts "Dealer Hand: #{dealer}"
  puts " "
  puts "----------------------------"
  puts " "
  puts "Player Hand: #{player}"
  puts "Player Hand Value: #{hand_value(player_hand)}"
  puts " "
end

def clear_screen
  system 'clear'
  system 'cls'
end

def show_cards_table(hand, player = ' ')
  hand_cards = []
  hand.each_with_index do |v, i|
    player == 'Dealer' && i == CARD_HIDE ? hand_value = 'X' : hand_value = v[0]
    hand_cards << hand_value
  end
  hand_cards.join(' ')
end

def card_value(crd)
  card = crd[0]

  if card == 'J' ||
     card == 'Q' ||
     card == 'K' ||
     card == '1'
    10
  elsif card == 'A'
    11
  else
    crd[0].to_i
  end
end

def hand_value(hand_value)
  sum = 0
  hand_value.each do |v|
    sum += v[1]
    if v[0][0] == 'A'
      sum -= 10 if sum > GAME_POINTS
    end
  end
  sum
end

def initial_deal!(shuffled_deck)
  hand = []
  2.times do
    dealed_card = deal_card!(shuffled_deck)
    hand << [dealed_card, card_value(dealed_card)]
  end
  hand
end

def play_deal!(shuffled_deck)
  hand = []
  dealed_card = deal_card!(shuffled_deck)
  hand.concat([dealed_card, card_value(dealed_card)])
end

def deal_card!(deck)
  deck.pop
end

def busted?(hand)
  true if hand_value(hand) > GAME_POINTS
end

def show_end_mssg(player_hand, dealer_hand)
  puts "Player hand is: #{show_cards_table(player_hand)}," \
       " count is #{hand_value(player_hand)}"
  puts "Dealer hand is: #{show_cards_table(dealer_hand)}," \
       " count is #{hand_value(dealer_hand)}"
end

def hit_stay?(answer)
  case answer
  when 'stay' then 's'
  when 'hit' then 'h'
  end
  answer
end

# game
player_points = 0
dealer_points = 0

loop do
  shuffled_deck = shuffle_deck
  player_hand = []
  dealer_hand = []

  player_hand = initial_deal!(shuffled_deck)
  dealer_hand = initial_deal!(shuffled_deck)

  show_play_table(player_hand, dealer_hand)

  loop do
    answer = ''
    loop do
      puts "(h)it or (s)tay?"
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(hit_stay?(answer))
      puts "Select correct action, please"
    end
    break if answer == 's' || busted?(player_hand)
    player_hand << play_deal!(shuffled_deck)
    break if busted?(player_hand)
    show_play_table(player_hand, dealer_hand)
  end

  show_play_table(player_hand, dealer_hand)

  if busted?(player_hand)
    puts "So, sorry...."
  else
    puts "You chose to stay"
  end

  # dealer playing
  loop do
    break if busted?(player_hand) || hand_value(dealer_hand) >= DEALER_MAX
    puts "Dealer playing..."
    dealer_hand << play_deal!(shuffled_deck)
    break if busted?(dealer_hand)
    show_play_table(player_hand, dealer_hand)
  end

  hand_value_player = hand_value(player_hand)
  # who won?
  if ((hand_value_player <= GAME_POINTS) &&
     (hand_value_player > hand_value(dealer_hand))) ||
     busted?(dealer_hand)
    puts "Player wins"
    player_points += 1
    show_end_mssg(player_hand, dealer_hand)
  elsif hand_value(dealer_hand) <= GAME_POINTS
    puts "Casino wins"
    dealer_points += 1
    show_end_mssg(player_hand, dealer_hand)
  end

  puts "Total Score => Player: #{player_points} Dealer: #{dealer_points}"
  break if player_points == WINNIG_POINTS || dealer_points == WINNIG_POINTS

  # new game?
  puts "Do you want to play again (y/n)"
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if ['y', 'n'].include?(answer)
    puts "Select correct action, please"
  end
  break if answer == 'n'
end

puts "Thanks for playing Twenty One. Good Bye!"
