require_relative "../tictactoe.rb"

describe Board do 
let (:board) {Board.new}
describe "#game_over"  do 

it "returns true if all horizontal squares are the same" do
row = Array.new(3) { ["x"] }
board.board[0] = row
expect(board.game_over).to eql true
end
it "returns true when diaognal squares are the same" do 
row = Array.new(3) { ["x"] }
board.board[2] = row
board.board[1][1] = "x"	
expect(board.game_over).to eql true
end	
end


describe "#mark" do 
it "marks Y"  do 
x = board.board[0][0]	
expect{board.mark(:a1,"y")}.to change{x}.to(["y"])
end	
end	
end	



