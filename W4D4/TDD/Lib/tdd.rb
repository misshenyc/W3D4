
# def remove_dups(arr)
#     arr.uniq
# end

# class Array

#     def two_sum
#         fin = []
#         self.each_with_index do |el1, i1|
#             self.each_with_index do |el2, i2|
#                 if i2 > i1 && el1 + el2 == 0
#                     fin << [i1, i2]
#                 end
#             end
#         end
#         fin
#     end

# end

# def my_transpose(arr)
#     # (0...arr.length).map do |i|
#     #     arr.each do |sub|
#     #         sub[i]
#     #     end 
#     # end 

#     transposed = Array.new(3) {Array.new(3)}
#     (0...arr.length).each do |i1|
#         (0...arr.length).each do |i2|
#             transposed[i1][i2] = arr[i2][i1]
#         end 
#     end 
#     transposed
# end 

# def stock_picker(arr)
#     max = 0
#     fin = []
#     arr.each_with_index do |el1, i1|
#         arr.each_with_index do |el2, i2|
#             if i2 > i1 && el2 - el1 > max
#                 max = el2 - el1
#                 fin = [i1, i2]
#             end
#         end
#     end
#     fin
# end 
require"byebug"

class Towers
    attr_accessor :towers, :num

    def initialize(n=3)
        @towers = [(1..n).to_a, [], []]
        @num = n 
    end

    def get_move
        puts "select starting & ending tower, like 1,2"
        moves = gets.chomp.split(",").map(&:to_i)
        moves.map {|pos| pos-1}
    end

    def move_piece(move)
        from = move.first
        to = move.last
        piece = @towers[from].shift
        @towers[to].unshift(piece)
    end

    def play
        until won?
            move = get_move
            if valid_move?(move)
                move_piece(move)
                render 
            else
                puts "invalid move, try again"
                render 
            end
        end
    end

    def won? 
        @towers[0].empty? && @towers[1..2].any? { |tower| tower == (1..n).to_a }
    end 
    
    def valid_move?(move)
        return false if @towers[move.first].empty?
        return false if @towers[move.last].length == @num
        return false if !@towers[move.last].empty? && (@towers[move.first].first > @towers[move.last].first)
        true  
    end 

    def render
        # @towers.each { |tower| puts tower }
        puts "tower1: #{@towers[0]}"
        puts "tower2: #{@towers[1]}"
        puts "tower3: #{@towers[2]}"
    end
end