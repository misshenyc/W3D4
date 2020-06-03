require_relative "pieces"

module Stepable

    KNIGHT_MOVES = [
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -1],
        [1, -2],
        [-1, 2],
        [-1, -2],
        [1, 2]
    ]

    KING_MOVES = [
        [1, 0],
        [1, -1],
        [1, 1],
        [0, -1],
        [-1, -1],
        [-1, 0],
        [0, 1],
        [-1, 1]
    ]

    def moves
        all_moves_arr = []

        current_row, current_col = self.pos
        self.move_diffs.each do |row, col|
            new_pos = [current_row + row, current_col + col]
            next if !self.board.valid_pos?(new_pos)
            if self.empty? || color != board[new_pos].color
            all_moves_arr << new_pos
            end
        end

        all_moves_arr
    end

    private

    def move_diffs
        raise NotImplementedError
    end
    
end



        #     0   1   2   3   4   5   6   7 # COLUMNS
 # ROWS # 0 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 1 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 2 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 3 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 4 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 5 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 6 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 7 [:O, :O, :O, :O, :O, :O, :O, :O]