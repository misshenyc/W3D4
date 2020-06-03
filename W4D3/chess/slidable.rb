
module Slidable

    # HORIZONTAL_DIRS stores an array of horizontal directions
    # when a piece moves in a given direction, its row and/or its column should increment by some value
    # ex: A piece starts at position [1, 2] and it moves horizontally to the right
      # its position changes to [1,3]
      # the row increases by 0 and the column increases by 1

    HORIZONTAL_DIRS =[
        [0, -1],  # left 
        [0, 1],  # right
        [-1, 0],  # up
        [1, 0]   # down
].freeze

    DIAGONAL_DIRS =[
        [-1, -1], # left up
        [1, 1], # right down
        [-1, 1], # right up
        [1, -1]  # left down
].freeze
    

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    # should return an array of places a Piece can move to

    # create array to collect moves

    # iterate over each of the directions in which a slideable piece can move
      # use the Piece subclass' `#move_dirs` method to get this info
      # for each direction, collect all possible moves in that direction
        # and add them to your moves array 
        # (use the `grow_unblocked_moves_in_dir` helper method)

    # return the final array of moves (containing all possible moves in all directions)
    def moves
      move_arr_all = []
      move_dirs.each do |row, col| 
        move_arr_all += grow_unblocked_moves_in_dir(row, col)
      end
      move_arr_all
    end
    
    private

    def move_dirs
      raise NotImplementedError 
    end


    # this helper method is only responsible for collecting all moves in a given direction
  # the given direction is represented by two args, the combination of a dx and dy

# create an array to collect moves

    # get the piece's current row and current column

    # in a loop:
      # continually increment the piece's current row and current column to generate a new position
      # stop looping if the new position is invalid (not on the board); the piece can't move in this direction
      # if the new position is empty, the piece can move here, so add the new position to the moves array
      # if the new position is occupied with a piece of the opposite color, the piece can move here (to capture the opposing piece), so add the new position to the moves array
        # but, the piece cannot continue to move past this piece, so stop looping
      # if the new position is occupied with a piece of the same color, stop looping

    # return the final moves array
    
    def grow_unblocked_moves_in_dir(row, col) #[-1, 1]
        moves_arr =[]

        current_row, current_col = self.pos
        
        loop do 
            current_row += row
            current_col += col
            new_pos = [current_row, current_col]
            break if !self.board.valid_pos?(new_pos)
            moves_arr << new_pos if self.empty? || color != board[new_pos].color
            moves_arr << [current_row - row, current_col - col] if color == board[new_pos].color
        end
        
        moves_arr
    end
end


        #     0   1   2   3   4   5   6   7 # COLUMNS
 # ROWS # 0 [:q, :O, :O, :O, :O, :O, :O, :O]
        # 1 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 2 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 3 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 4 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 5 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 6 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 7 [:O, :O, :O, :O, :O, :O, :O, :O]
    