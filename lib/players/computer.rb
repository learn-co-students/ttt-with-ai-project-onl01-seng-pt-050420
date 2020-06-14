module Players
  class Computer < Player
    def move
      puts "Please enter 1-9:"
      user_input = gets.strip
      #index = input_to_index(user_input)
      
      # if valid_move?(index) 
      #   move(index, current_player)
      #   display_board
      # else
      #   m
      # end
    end
  end
end