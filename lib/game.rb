class Game
  attr_accessor :board
  attr_reader :player_1, :player_2

  def initialize(player_1, player_2, board)
    @board = Array.new(9," ")
    @player_1 = player_1
    @player_2 = player_2
    # @board = board || Array.new(9," ")
    # @player_1 = player_1 || Player.new("X")
    # @player_2 = player_2 || Player.new("O")
  end

  WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5], 
    [6,7,8], 
    [0,3,6], 
    [1,4,7], 
    [2,5,8], 
    [0,4,8], 
    [2,4,6]
   ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def player_1=(player)
    @player_1 = player
  end

  def player_2=(player)
    @player_2 = player
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    
    if valid_move?(index) 
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    @board.all?{|element| element == "X" || element == "O"}
  end
 
end