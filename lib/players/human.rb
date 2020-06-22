module Players

  class Human < Player

    def move(token)
      puts("Player #{token} please choose a position")
      gets.strip
    end

  end
end