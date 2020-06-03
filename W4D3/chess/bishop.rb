require_relative "pieces"
require_relative "slidable"



class Bishop < Piece
    include Slidable
    
    def symbol
        '♝'.colorize(color)
    end

    protected

    def move_dirs
        diagonal_dirs
    end

end
