# tIC tAC TOE
# found this method on stackoverflow
class Array
  def same_values?
    uniq.length == 1
  end
  
  attr_accessor :marked
  end

class Player
  def initialize(name)
    @name = name
  end

  attr_reader :name
  end

class Board
attr_accessor :board

  def initialize
    @board = [[[:a1], [:b1], [:c1]], [[:a2], [:b2], [:c2]], [[:a3], [:b3], [:c3]]]
    end
  def draw
    @board.each_with_index do |x, i|
      x.each_with_index do |y, j|
        print y[0]
        print '|' unless j == 2
      end
      print "\n"
    end
   end

  def mark(sqr, mrk)
    board.each do |x|
      x.each do |y|
        if y.include?(sqr)
          y[y.index(sqr)] = mrk
          return y
   end
      end
    end
  end

  attr_reader :board

  def game_over
    results = []
    @board.each { |inner_array| results << inner_array.same_values? }
    for i in 0..2
      columns = []
      @board.each do |inner_array|
        columns << inner_array[i]
      end
      results << columns.same_values?
   end
    subarray = [[@board[0][0], @board[2][2]], [@board[0][2], @board[2][0]]]
    subarray.each do |inner_array|
    results << (inner_array.uniq.include?(@board[1][1]) && inner_array.same_values?)
    end
    results.include?(true)
    end
      end
# --------------------------
def start_game
  board = Board.new
  player1 = Player.new('Player 1')
  player2 = Player.new('Player 2')
  player = player1
  mark = 'X '
  board.draw
  loop do
    if board.board.all? { |x| x.all? { |y| y.marked == true } }
      puts 'It is a DRAW!!'
      return
    end
    print "#{player.name} please enter a square to mark as a1, c2, b3 etc. :"
    choice = STDIN.gets.chomp.to_sym.downcase
    y = board.mark(choice, mark)
    y.marked = true
    puts
    board.draw
    puts
    break if board.game_over
    mark = mark == 'O ' ? 'X ' : 'O '
    player = player == player2 ? player1 : player2
  end
  puts "#{player.name} WON! Congratulations #{player.name}:)"
  end

