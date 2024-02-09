##
# game.rb

require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @player_1 = 'X'
    @player_2 = 'O'
    @current_player = @player_1
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    until game_over?
      @board.print_board
      take_turn
      switch_players! unless game_over?
    end
    print "Game over! "
    if @board.has_tic_tac_toe?
      puts "Player #{@current_player} wins!"
    else
      puts "It's a draw!"
    end
  end

  private

  def switch_players!
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def game_over?
    @board.has_tic_tac_toe? || !@board.has_open_spots?
  end

  def take_turn
    if @current_player == @player_1
      puts "Player 1 (X) enter your move (row [0-2], column [0-2]):"
    else
      puts "Player 2 (O) enter your move (row [0-2], column [0-2]):"
    end
    row, column = gets.chomp.split.map(&:to_i)
    until @board.add_piece!(row, column, @current_player)
      puts "Invalid move, try again."
      row, column = gets.chomp.split.map(&:to_i)
    end
  end
end
