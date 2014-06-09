require_relative "TicTacToe"
require_relative "Computer"
require_relative "Game"
require_relative "RecursiveComputer"


puts "Please pick your computers difficulty!\n"

print "1. Easy\n"
print "2. Hard\n"
valid = false

while (!valid)
	choice = gets.chomp.to_i
	if choice == 1
		valid = true
		computer = Computer.new
  elsif choice == 2
		valid = true
		computer = RecursiveComputer.new
	end
end

tictactoe = TicTacToe.new
game = Game.new(tictactoe,computer)

game.start
