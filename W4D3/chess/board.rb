require_relative "knight"
require_relative 'pieces'
require_relative "null"

class Board

    attr_accessor :rows, :sentinel
    def initialize
        @sentinel = NullPiece.instance
        @rows = Array.new(8){ Array.new(8, @sentinel) }

        # @rows[0].map! { |pos| Piece.new }
        # @rows[1].map! { |pos| Piece.new }
        # @rows[-2].map! { |pos| Piece.new }
        # @rows[-1].map! { |pos| Piece.new }

        self[[0,0]] = Knight.new("white", self, [0,0])
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "no piece available" if !self[start_pos].is_a?(Piece) 
        raise "destination occupied" if self[end_pos] != self.sentinel
        self[end_pos] = self[start_pos]
        self[start_pos] = self.sentinel
    end

    def valid_pos?(pos)
        pos.all? {|position| position.between?(0,7) }
    end
end