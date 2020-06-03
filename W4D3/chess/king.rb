require_relative "pieces"
require_relative "stepable"


class King < Piece
    include Stepable

    def symbol
        '♚'.colorize(color)
    end

    protected

    def move_diffs
        KING_MOVES
    end

end