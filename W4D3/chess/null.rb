require_relative "pieces"
require "singleton"

class NullPiece < Piece
    include Singleton

    def initialize
        @symbol = "null"
        @color = "null"
    end

    def moves
        board.flatten.each { |piece| piece.pos if piece.empty? }
    end

    def symbol
        "_"
    end
end