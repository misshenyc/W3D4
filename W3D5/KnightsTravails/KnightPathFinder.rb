require_relative "00_tree_node"

class KnightPathFinder

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = []
    end

    def self.valid_moves(pos)
        row, col = pos
        possiblities = [
        [row+1, col+2],
        [row+1, col-2],
        [row-1, col+2],
        [row-1, col-2],
        [row+2, col+1],
        [row+2, col-1],
        [row-2, col+1],
        [row-2, col-1],
        ]
        possiblities.select?{|row,col|(0..7).include?(row) && (0..7).include?(col)}          
    end

    def new_move_positions(pos)
        return pos if !considered_positions.include?(pos) && KnightPathFinder.valid_moves(pos)
    end

    def build_move_tree(destination)
        start_pos = @root_node
        queue = [start_pos]
        until queue.empty?
            firsty = queue.shift
            return firsty if firsty == destination
            queue += KnightPathFinder.valid_moves(firsty)
        end
        nil
    end

    def build_move_tree
        start_pos = @root_node
        next_moves = KnightPathFinder.valid_moves(start_pos)
        next_moves.each do |move|
            
        end 
    end

end

