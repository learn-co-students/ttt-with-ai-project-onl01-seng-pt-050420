module Players
  class Human < Player

    def move(board)
      puts "Where do you want to go?"
      answer = gets.chomp
      return answer
    end

  end
end