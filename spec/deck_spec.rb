require '../lib/card'
require '../lib/deck'
require 'pry'

RSpec.describe Deck do
    it 'exists' do
        deck = Deck.new(["card"])

        expect(deck).to be_instance_of(Deck)
    end

    it 'creates an array of cards' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        expect(cards).to eq([card_1, card_2, card_3])
    end

    it 'deck can contain cards' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        # binding.pry
        expect(deck.cards).to eq(cards)
    end

    it 'deck count equals 3' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)
        
        expect(deck.count).to eq(3)
    end

    it 'can seperate by category' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        expect(deck.cards_in_category(:STEM)).to contain_exactly(card_2, card_3)
        expect(deck.cards_in_category(:Geography)).to contain_exactly(card_1)
        expect(deck.cards_in_category("Pop Culture")).to contain_exactly()
    end
end


