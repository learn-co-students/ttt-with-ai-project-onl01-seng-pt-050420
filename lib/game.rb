class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def current_player
    if @board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      count = 0
      initial_index = combo[0]
      combo.each do |position|
        if @board.cells[position] == @board.cells[initial_index]
          count += 1 unless @board.cells[initial_index] == ' '
        end
      end
      return combo if count == 3
    end
    false
  end

  def draw?
    @board.cells.each do |position|
      won_or_not_won = won?
      return false if position == ' ' || won_or_not_won != false
    end
    true
  end

  def over?
    won? || draw?
  end

  def winner
    winner_is_combo = won?
    if winner_is_combo == false
      nil
    else
      winning_token = winner_is_combo[0]
      @board.cells[winning_token]
    end
  end

  def valid_move?(index)
    if (0..8).include?(index)
      @board.cells[index] == " "
    else
      false
    end
  end

  def turn
    puts('Choose a position on the board between 1 and 9')
    user_input = current_player.move(current_player.token)
    turn if valid_move?(user_input.to_i-1) == false
    @board.update(user_input, current_player)
  end

  def play
    turn until over?
    if won?
      winner_of_game = winner
      puts "Congratulations #{winner_of_game}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
