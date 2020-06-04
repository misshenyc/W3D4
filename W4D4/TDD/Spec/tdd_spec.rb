require "tdd"
require 'rspec'

# describe "remove_dups" do
#    it "remove duplicated elements from an array" do 
#     expect(remove_dups([1,2,3,1,2])).to eq([1,2,3])
#    end
# end


# describe Array do
#    subject(:arr) {Array.new([-1,0,2,-2,1])}

#    it "return indices where the elements at those positions sum to zero" do
#       expect(arr.two_sum).to eq([[0,4],[2,3]])
#    end
   
# end

# describe "my_transpose" do 
#    original = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#    ]

#    transposed = [
#       [0, 3, 6],
#       [1, 4, 7],
#       [2, 5, 8]
#    ]  
#    it "transpose 2d array" do 
#       expect(my_transpose(original)).to eq(transposed)
#    end 
# end 

# describe "stock_picker" do 
#    stock_prices = [10, 30, 15, 70, 60, 20]
#    it "return most profitable pair of buy/sell days" do 
#       expect(stock_picker(stock_prices)).to eq([0,3])
#    end 
# end 

describe Towers do
   subject(:tower) { Towers.new }
   context "initialize" do 
      it "initialize towers" do 
      expect(tower.towers).to eq([[1, 2, 3], [], []])
      expect(tower.num).to eq(3)
      end 
   end 

   context "get_move" do 
      it "should get move from player" do 
         #allow(tower).to receive(:get_move([1,2]))
         expect(tower.get_move).to be_a(Array)
      end 
   end 

   context "move_piece" do 
      it "should move piece from one tower to another" do 

      end 
   end 
end 

