module Players

  class Computer < Player

    attr_reader :token, :moves

    def initialize(token)
      @token = token
      @moves = [4, 8, 6, 2, 0, 7, 5, 3, 1]
    end

    def move(board)
      @board = board
      possible_moves = empty_cells
      computer_move = nil
      while computer_move.nil?
        @moves.each do |move|
          computer_move = move + 1 if possible_moves.include?(move)
        end
      end
      computer_move.to_s
    end

    def empty_cells
      [].tap do |cells|
        @board.cells.each_with_index do |cell, index|
          cells << index if cell == " "
        end
      end
    end
  end
end
