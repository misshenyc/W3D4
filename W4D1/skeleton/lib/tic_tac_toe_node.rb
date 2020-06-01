require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator) 
    if board.over? 
       board.winner != evaluator && board.winner != nil
    end
    
    if next_mover_mark == evaluator 
      children.all? do |child|
        child.losing_node?(evaluator)
      end
    else
      children.any? do |child|
        child.losing_node?(evaluator)
      end
    end

  end

  def winning_node?(evaluator)


  end

  # This method generates an array of all moves that can be made after
  # the current move.


  def children
    nodes = []
    (0...3).each do |i1|
      (0...3).each do |i2|
        pos = [i1, i2]
         if board.empty?(pos)
          kids_board = board.dup
          kids_board[pos] = next_mover_mark
          if next_mover_mark == :x
              nodes << TicTacToeNode.new(kids_board, :o, pos)
          else
              nodes << TicTacToeNode.new(kids_board, :x, pos)
          end
          prev_move_pos = pos
         end
        end
      end  

    nodes
  end
end





# private
#   def place_mark(pos, mark)
#     if self.board.empty?(pos)
#       self.board[pos] = mark
#       true
#     else
#       false
#     end
#   end
