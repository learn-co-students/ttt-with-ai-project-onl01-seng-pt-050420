module Players
    class Computer < Player

        def move(board)
            if !board.taken?('5')
              '5'
            else
              random
            end
          end
     
        def random
            (0..8).to_a.sample
        end
    end
  end