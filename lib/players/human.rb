module Players

  class Human < Player

    def move(board)
      system('clear')
      board.display
      puts('')
      puts("Player #{@token} please choose a position")
      gets.strip
    end

  end
end