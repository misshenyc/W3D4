require_relative "pieces"
require_relative "stepable"

class Knight < Piece
    include Stepable

    def symbol
        '♞'.colorize(color)
    end
    
    def move_diffs
        KNIGHT_MOVES
    end

end