module Players

  class Computer < Player

    attr_reader :token, :moves, :ranks

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def initialize(token)
      @token = token
      @moves = [4, 8, 6, 2, 0, 7, 5, 3, 1]
      @ranks = []
    end

    def move(board)
      @board = board
      @ranks = rank_combos
      system('clear')
      @board.display
      if @board.turn_count == 0
        "5"
      else
        computer_move = win_block_or_move
        computer_move
      end
    end

    def win_block_or_move
      computer_move = nil
      possible_computer_win = chicken_dinner
      if possible_computer_win[:flag] == true
        computer_move = possible_computer_win[:position]
      else
        possible_player_win = failure
        if possible_player_win[:flag] == true
          computer_move = possible_player_win[:position]
        else
          possible_moves = empty_cells
          @moves.each do |move|
            computer_move = move if possible_moves.include?(move)
          end
        end
      end
      computer_move += 1
      computer_move.to_s
    end

    def failure
      possible_loss = @ranks.select { |x| x[:count] == -2 }
      move = nil
      if !possible_loss.empty?
        possible_loss[0][:positions].each do |hash|
          hash.each do |k, v|
            move = k if v == 0
          end
        end
        win = {
            flag: true,
            position: move
        }
        win
      else
        {
            flag: false
        }
      end
    end

    def chicken_dinner
      possible_win = @ranks.select { |x| x[:count] == 2 }
      move = nil
      if !possible_win.empty?
        possible_win[0][:positions].each do |hash|
          hash.each do |k, v|
            move = k if v == 0
          end
        end
        win = {
          flag: true,
          position: move
        }
        win
      else
        {
          flag: false
        }
      end
    end

    def rank_combos
      rank_combos = []
      WIN_COMBINATIONS.each do |combo|
        rank = {}
        rank[:combo] = combo
        rank[:used] = []
        rank[:positions] = []
        count = 0
        combo.each do |position|
          if @board.cells[position] == @token
            rank[:positions] << { position => 1}
            rank[:count] = count += 1
            rank[:used] << position
          elsif @board.cells[position] == " "
            rank[:positions] << { position => 0 }
          else
            rank[:positions] << { position => -1 }
            rank[:count] = count -= 1
            rank[:used] << position
          end
        end
        rank_combos << rank
      end
      rank_combos
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

