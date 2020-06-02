require_relative "board"


class Piece
    def initialize(color, symbol, board, pos)
        @color = color
        @symbol = symbol
        @board = board
        @pos = pos
    end

    def moves
        @board.select{|pos| NullPiece}
    end

    def to_s
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def symbol
    end

    def move_into_check?(end_pos)
    end

end






















