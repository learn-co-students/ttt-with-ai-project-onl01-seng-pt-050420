require 'pry'
class Player
  attr_reader :token
  def initialize(token)
    @token = token
  end

  def move(board)
    puts "Please enter a space on the board 1-9:"
    user_input = gets.strip
    board[user_input] = token
  end
end

