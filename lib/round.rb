class Round 
    attr_reader :deck, :turns, :number_correct, :round_counter
    def initialize(deck)
        @deck =deck
        @turns = []
        @number_correct = 0
        @round_counter = 0
    end

    def current_card
        @deck.cards.first
    end

    def percent_correct
        percent = (@number_correct/@round_counter.to_f) * 100
    end

    def take_turn(guess)
        @round_counter += 1
        current_card = @deck.cards.shift
        turn = Turn.new(guess, current_card)
        @turns << turn
        if turn.correct?
            @number_correct += 1
        end
        turn
    end

    def number_correct_by_category(cat)
        category_correct_counter = 0
        @turns.each do |turn|
            if turn.card.category == cat && turn.correct?
                category_correct_counter += 1
            end
        end
        category_correct_counter
    end

    def percent_correct_by_category(cat)
        num_correct_category = 0
        round_by_category = 0
        
        @turns.each do |turn|
            if turn.card.category == cat 
                round_by_category += 1
                num_correct_category += 1 if turn.correct?
            end
        end
       (num_correct_category/round_by_category.to_f) * 100
    end
end


