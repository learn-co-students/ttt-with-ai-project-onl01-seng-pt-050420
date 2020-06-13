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
    board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end
  def winner
    if combo = won?
      @board.cells[combo[0]]
    end
  end
  def play 
    draw?
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def turn 
  player = current_player
  c_move = player.move(@board)
  puts "Please enter 1-9:"
  if !@board.valid_move?(c_move)
    turn
  else
    puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(c_move, player)
      puts "#{player.token} moved #{c_move}"
      @board.display
      puts "\n\n"
      draw?
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  def over?
    won? || draw?
  end
end