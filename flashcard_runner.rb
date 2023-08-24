require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is the tallest man made structre after the Great Pyramids?", "Eiffel Tower", :Geography)
card_5 = Card.new("What is the longest navigable river in the world?", "Amazon", :Geography)
card_6 = Card.new("What is the name of the newest and most powerful telescope that man has sent into space?", "James Webb", :STEM)
card_7 = Card.new("What Yosemite climber was the first person to ever free climb El Capitan?", "Lynn Hill", :Climbing)
card_8 = Card.new("Can you climb on wet sandstone?", "No!", :Climbing)
card_9 = Card.new("Where on Earth are you furthest from the center of the planet?", "Aconcagua", :Geography)
card_10 = Card.new("Does this game work?", "Yes", :STEM)
cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10]
deck = Deck.new(cards)
round = Round.new(deck)


puts "Welcome to my game!"
puts "-----------------------"
loop do
    puts "There are #{deck.count} cards left."
    puts "This is the question is:"
    puts "#{deck.cards.first.question}"
    answer = gets.chomp
    turn1 = round.take_turn(answer)
    puts "#{round.turns.last.feedback}"
    puts "So far you are batting #{round.percent_correct} percent correct overall"
    puts "----------------------" 
    break if deck.count == 0
end

puts "******* Game Over ********"
puts "These are your stats:"
puts "You scored %#{round.percent_correct} correct overall!"
puts "You scored %#{round.percent_correct_by_category(:Geography)} correct in the Geography category"
puts "You scored %#{round.percent_correct_by_category(:STEM)} correct in the STEM category"
puts "You scored %#{round.percent_correct_by_category(:Climbing)} correct in the Climbing category"

