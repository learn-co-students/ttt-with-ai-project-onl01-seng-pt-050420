class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]
  
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
        @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |win|
            @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]] && @board.cells[win[0]] != " "
        end
    end

    def over?
        won? || draw?
    end

    def draw?
        @board.full? && !won?
    end

    def winner
        if win_array = won?
            @winner = @board.cells[win_array[0]]  
        end
    end

    def turn
        player = current_player
        current_move = player.move(board)
        if !@board.valid_move?(current_move)
            turn
        else
            puts "Turn: #{@board.turn_count+1}\n"
            @board.update(current_move, player)
            puts "#{player.token} moved #{current_move}"
            @board.display
            puts "\n\n"
        end
    end

    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"   
        end 

    end

end