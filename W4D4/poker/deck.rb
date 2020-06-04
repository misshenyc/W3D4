require "card"

class Deck

    def initialize
        deck =[]
        Card.SUITS.each do |suit|
            Card.VALUES.each do |value|
                deck << Card.new(value, suit)
            end
        end
    end

    def count
        deck.size 
    end

    def shuffle
        deck.shuffle 
    end

    def take(num)
        fin = []
        num.times { fin << deck.shift}
        fin
    end
    #take from top of deck

    def return(cards)
        deck += cards 
    end
    #return to the bottom of deck

end