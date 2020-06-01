require_relative "00_tree_node"
require "byebug"

class KnightPathFinder

    attr_accessor :root_node, :considered_positions
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        # @start_position = pos
        build_move_tree
    end

    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        path = []
        current_node = end_node

        until current_node.nil?
            # debugger
            path << current_node.value
            current_node = current_node.parent
        end

        path.reverse
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
        possiblities.select{|row,col|(0..7).include?(row) && (0..7).include?(col)}          
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos).reject{|pos|considered_positions.include?(pos)}
        new_moves.each{|pos|considered_positions << pos}
    end

    def build_move_tree
        queue = [root_node]
        until queue.empty?
            firsty = queue.shift
            self.new_move_positions(firsty.value).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                firsty.add_child(next_node)
                queue << next_node
            end
        end
    end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]