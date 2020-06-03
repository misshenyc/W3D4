require_relative "pieces"

class Pawn < Piece

    def symbol
        "♙".colorize(color)
    end

    def move_dirs
        pawn_moves = [[-1, 0], [1, 0]]
        pawn_moves
    end

    private

    def at_start_row?
        self.pos == board[1] || self.pos == board[-2]
    end

    def forward_dir
        if self.pos == board[1]
            return 1
        elsif self.pos == board[-2]
            return -1
        end
    end

    def forward_steps
        if board.valid_pos?(next_pos) && board.empty?(next_pos)
            if self.forward_dir == 1
                row, col = pos
                next_pos = [row+ 1, col ]
            elsif self.forward_dir == -1
                row, col = pos
                next_pos = [row -1, col]
            end
        end
        board[next_pos] = self
    end

    end

    def side_attacks
        
    end
    
end



        #     0   1   2   3   4   5   6   7 # COLUMNS
 # ROWS # 0 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 1 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 2 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 3 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 4 [:O, :O, :O, :O, :O, :O, :O, :O]
        # 5 [:O, :O, :P, :O, :P, :O, :O, :O]
        # 6 [:O, :O, :O, :P, :O, :O, :O, :O] #[6, 3] [5, 2], [5, 4]
        # 7 [:O, :O, :O, :O, :O, :O, :O, :O]