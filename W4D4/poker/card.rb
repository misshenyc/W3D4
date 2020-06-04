
class Card

    attr_reader :value, :suit

    def initialize(value, suit)
        @value = value
        @suit = suit
        @pos = facedown
        raise "not an option!" if !SUITS.include?(suit) || !VALUES.include?(value)
    end

    def ==(card)
        self.value == card.value 
    end


    def <=>(card)
        self.value <=> card.value
    end

    private:

    SUITS =[club, spade, diamond, heart]
    VALUES = [A, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K]

end