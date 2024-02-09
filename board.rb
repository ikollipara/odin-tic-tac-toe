##
# board.rb

##
# Board

class Board
  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def print_board
    @board.each do |row|
      puts row.map { |cell| cell || ' ' }.join(' | ')
      puts '-' * 9
    end
  end

  def add_piece!(row, column, piece)
    if @board[row][column].nil?
      @board[row][column] = piece
      true
    else
      false
    end
  end

  def has_open_spots?
    @board.flatten.any? { |cell| cell.nil? }
  end


  def has_tic_tac_toe?
    row_1 = @board[0]
    row_2 = @board[1]
    row_3 = @board[2]
    column_1 = @board.transpose[0]
    column_2 = @board.transpose[1]
    column_3 = @board.transpose[2]
    diagonal_1 = [@board[0][0], @board[1][1], @board[2][2]]
    diagonal_2 = [@board[0][2], @board[1][1], @board[2][0]]


    case
    when (row_1.all? and row_1.uniq.length == 1)
      true
    when (row_2.all? and row_2.uniq.length == 1)
      true
    when (row_3.all? and row_3.uniq.length == 1)
      true
    when (column_1.all? and column_1.uniq.length == 1)
      true
    when (column_2.all? and column_2.uniq.length == 1)
      true
    when (column_3.all? and column_3.uniq.length == 1)
      true
    when (diagonal_1.all? and diagonal_1.uniq.length == 1)
      true
    when (diagonal_2.all? and diagonal_2.uniq.length == 1)
      true
    else false
    end

  end
end
