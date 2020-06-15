module Players
  class Computer < Player
    attr_reader :token
    def initialize(token)
      @token = token
    end
    
    def move(board)
      puts "Please enter a space on the board 1-9:"
      user_input = gets.strip
      index = user_input.to_i - 1
      @board[index] = self.token
      index
      binding.pry
    end
  end
end