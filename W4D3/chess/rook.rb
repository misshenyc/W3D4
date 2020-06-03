require_relative "pieces"
require_relative "slidable"


class Rook < Piece
    include Slidable

    def symbol
        '♜'.colorize(color)
    end

    protected

    def move_dirs
        horizontal_dirs
    end

end