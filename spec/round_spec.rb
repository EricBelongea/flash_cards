require '../lib/card'
require '../lib/turn'
require '../lib/deck'
require '../lib/round'
require 'pry'

RSpec.describe Round do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
    end

    it 'is a deck' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        deck = Deck.new([card_1,card_2,card_3])

        expect(deck).to be_instance_of(Deck)
    end

    it 'initiates the round' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        
        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
    end

    it 'can call the deck' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        
        round = Round.new(deck)

        expect(round.deck).to eq(deck)
    end

    it 'can take turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it 'will have a current card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        
        round = Round.new(deck)

        expect(round.current_card).to eq(cards[0])
        # binding.pry
    end

    it 'new turns creates a new card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.card).to eq(card_1)
        expect(new_turn.guess).to eq("Juneau")
        # binding.pry
    end

    it 'is an instance of Turn' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.class).to eq(Turn)
    end

    it 'knows if it is correct?' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.correct?).to be true
    end

    it 'knows if it is INcorrect' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Haines")

        expect(new_turn.correct?).to be false
    end

    it 'has an array of the turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(round.turns).to eq([new_turn])
    end

    it 'acknowledges the correct answer' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(round.number_correct).to eq(1)
    end

    it 'can iterate to the next card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(round.current_card).to eq(card_2)
    end

    it 'can take a turn with different cards' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")
        turn2 = round.take_turn("Venus")

        expect(turn2.card).to eq(card_2)
        expect(turn2.guess).to eq("Venus")
    end

    it 'counts turns and returns feedback' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")
        turn2 = round.take_turn("Venus")
        
        expect(round.turns.count).to eq(2)
        expect(round.turns.last.feedback).to eq("Incorrect")
    end

    it 'counts the number of correct answers' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")
        turn2 = round.take_turn("Venus")

        expect(round.number_correct).to eq(1)
    end

    it 'correct by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")
        turn2 = round.take_turn("Venus")
        turn3 = round.take_turn("North north west")

        expect(round.number_correct_by_category(:Geography)).to eq(1)
        expect(round.number_correct_by_category(:STEM)).to eq(1)
        # binding.pry
    end

    it 'smoke test by category' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")
        turn2 = round.take_turn("Venus")
        turn3 = round.take_turn("North north west")

        expect(round.number_correct).to eq(2)
        expect(round.number_correct_by_category(:STEM)).to eq(1)
    end

    it 'has a percentage for the number of correcty answers' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")
        turn2 = round.take_turn("Venus")

        expect(round.number_correct).to eq(1)
        expect(round.round_counter).to eq(2)

        expect(round.percent_correct).to eq(50.0)
    end

    it 'percent correct by category' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")
        turn2 = round.take_turn("Venus")

        expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
        expect(round.percent_correct_by_category(:STEM)).to eq(0.0)
    end

    it 'percent correct by category smoke test' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau") # correct answer :Geography
        turn2 = round.take_turn("Venus") # wrong answer :STEM
        turn3 = round.take_turn("North") # correct answer :STEM
        
        expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
        expect(round.percent_correct_by_category(:STEM)).to eq(0.0)
    end
end
