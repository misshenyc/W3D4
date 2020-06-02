require_relative "pieces"
require "singleton"

class NullPiece < Piece
    include Singleton

    def initialize
        @symbol = "null"
        @color = "null"
    end

    def move
    end

    def symbol
    end
end