require 'card.rb'
require 'deck.rb'
require 'players.rb'

p1 = Player.new
dealer = Player.new
game_deck = Deck.new
gm = GameRules.new
keep_drawing = false
loser = false

puts "\n"
puts "Wellcome, you're playing Black Jack a game designed and developd by Matheus".center(93)
puts 'Thanks for your time, enjoy the game.'.center(55)
puts 'A quick guide before you start, the goal here is to beat de Dealer'.center(85)
puts 'You will receive a pair of cards in the beggining of the game'.center(80)
puts "Each card has a value 2~10 has it's number as it's value".center(74)
puts 'Ex: if have a hand of 10 and 8, you got 18 points.'.center(68)
puts "\n"
puts 'The Dealer will draw one then you decide if you stop quit or ask for 1 more card'.center(98)
puts 'The limit is 21 points, so if you go over 21 you lose the game'.center(81)
puts 'After you are done with your play, the Dealer receives his final card'.center(88)
puts 'Whoever has the most points whitout going over 21 Wins!'.center(74)
puts "\n"
puts 'Now good luck and enjoy the game.'.center(80)
puts "\n"
puts "What's your name?"
p1.name = gets.chomp
p1.hand = []
p1.points = 0
dealer.name = 'Dealer'
dealer.hand = []
dealer.points = 0
puts "#{p1.name} now the #{dealer.name} will shuffle the deck"
puts 'Keep yours eyes open!'
game_deck.deck_shuffle
puts "All set, let's draw"
dealer.hand.push(game_deck.draw)
dealer.points += dealer.hand[-1].value
puts "Alright the Dealer already has his card"
puts "Now #{p1.name} it's your turn!"
p1.hand.push(game_deck.draw)
p1.hand[0].show_card_value(p1)
p1.points += p1.hand[0].value
puts "Now your second card"
p1.hand.push(game_deck.draw)
p1.hand[1].show_card_value(p1)
p1.points += p1.hand[1].value
puts "#{p1.name} you have #{p1.points} points now!"
puts "#{p1.name} now you have three choices"
puts "Keep drawing to get more cards and points"
puts "Remenber the limit of 21 points, you have a total of #{p1.points}"
puts "Stop and then #{dealer.name} will draw his final card"
puts "And whoever has the most points will win"
puts "or if you think your draws are too bad you can give up now"
puts "press 0 for givin up, 1 to draw another card, 2 to stop"
p1_answer = gets.chomp.to_i
case p1_answer
when p1_answer === 0, 0
  puts "Better luck next time, #{p1.name}"
when p1_answer === 1, 1
  draw_again = true
  while draw_again == true
  p1.hand.push(game_deck.draw)
  p1.hand[-1].show_card_value(p1)
  p1.points += p1.hand[-1].value
  if gm.over_21?(p1)
    loser = true
    draw_again = false
    puts "Seems like you burst you hand, remember that you cannot go over 21"
    puts "Better luck next time"
    break
  end
  puts "#{p1.name} you have a total of #{p1.points} do you wanna draw again? Y/N"
  response = gets.chomp.upcase
    if response == "Y"
      draw_again = true
    elsif response == "N"
      draw_again = false
      dealer.hand[-1].show_card_value(dealer)
      dealer.hand.push(game_deck.draw)
      dealer.hand[-1].show_card_value(dealer)
      dealer.points += dealer.hand[-1].value
      while dealer.points < 17
        dealer.hand.push(game_deck.draw)
        dealer.hand[-1].show_card_value(dealer)
        dealer.points += dealer.hand[-1].value
        if gm.over_21?(dealer)
          puts "Well you got lucky this time."
          loser = true
          break
        end
        if loser == false
          gm.declare_winner(p1, dealer)
        end
      end
    else 
      puts "Plase answer only with Y or N"
      response = gets.chomp.upcase
    end
  end
when p1_answer === 2, 2
  dealer.hand[-1].show_card_value(dealer)
  dealer.hand.push(game_deck.draw)
  dealer.hand[-1].show_card_value(dealer)
  dealer.points += dealer.hand[-1].value
  while dealer.points < 17
    dealer.hand.push(game_deck.draw)
    dealer.hand[-1].show_card_value(dealer)
    dealer.points += dealer.hand[-1].value
    if gm.over_21?(dealer)
      puts "Well you got lucky this time."
      loser = true
      break
    end
  end
  if loser == false
    gm.declare_winner(p1, dealer)
  end
end