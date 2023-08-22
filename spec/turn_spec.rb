require '../lib/turn'
require '../lib/card'

RSpec.describe Turn do
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", "card")


      expect(card).to be_instance_of(Card)
      expect(turn).to be_instance_of(Turn)
    end

    it 'guesses' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.string).to eq("Juneau")
    end

    it 'calls card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to eq(card)
    end

    it 'can determine if a guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to be true
    end

    it 'provides feedback if its correct' do  
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq("Correct!")
    end

    it 'tells you when youre wrong' do
        card2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn2 = Turn.new("Fairbanks", card2)

        expect(turn2.feedback).to eq("Incorrect")
    end
end
