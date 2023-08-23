class Round 
    attr_reader :deck, :turns
    def initialize(deck)
        @deck =deck
        @turns = []
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        current_card = @deck.cards.shift
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        new_turn
    end

    def number_correct
        correct_counter = 0
        if @guess == @answer
            correct_counter +=1
        end
    end
end


