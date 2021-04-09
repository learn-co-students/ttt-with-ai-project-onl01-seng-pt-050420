module Players
    class Human < Player

        def move(board)
            puts "please enter 1-9"
            gets.chomp
        end
     
    end
  end