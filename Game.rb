require_relative 'Player'

class Game
  attr_accessor :p1, :p2, :board, :current_player, :other_player

  def initialize(p1, p2)
    @p1, @p2 = Player.new(p1), Player.new(p2)
    @board = (1..9).to_a
    @current_player = @p1
    @other_player = @p2
    puts """Welcome to tic-tac-toe, there will be two players:
        player1 and player2. player1 always plays first and plays with 'x', while player2 plays with 'o'. The board will be displayed as such
        
             |     |     
          #{@board[0]}  |  #{@board[1]}  |  #{@board[2]}  
        _____|_____|_____
             |     |     
          #{@board[3]}  |  #{@board[4]}  |  #{@board[5]}  
        _____|_____|_____
             |     |     
          #{@board[6]}  |  #{@board[7]}  |  #{@board[8]}  
             |     |   

           At each turn, the player will be asked where they would like to place their symbol (be it 'x' or 'o') and the player needs to choose an integer from 1 to 9 (including) in order to make a move. Then, the number in the square will be replaced by the player's symbol. Otherwise the game works as expected.  
    """
  end

  def draw_board()
      drawing = """             |     |     
          #{@board[0]}  |  #{@board[1]}  |  #{@board[2]}  
        _____|_____|_____
             |     |     
          #{@board[3]}  |  #{@board[4]}  |  #{@board[5]}  
        _____|_____|_____
             |     |     
          #{@board[6]}  |  #{@board[7]}  |  #{@board[8]}  
             |     |   

"""
    puts drawing
  end
  
  def make_move()
    puts """Player#{@current_player.name[-1]}, it is now your turn."""
    @current_player.make_move
    @board[@current_player.next_move - 1] = @current_player.player_symbol
    if self.did_anyone_win? 
      puts "Player#{@current_player.name[-1]} is the winner! Better luck next time Player#{@other_player.name[-1]}"
      self.draw_board
    else
      holder = @current_player
      @current_player = @other_player
      @other_player = holder
      self.draw_board
    end
  end

  def did_anyone_win?()
    answer = false

    (0..2).each do |i|
      answer = true if @board[0 + i * 3] == @board[1 + i * 3] && @board[1 + i * 3] == @board[2 + i * 3]
      answer = true if @board[0 + i] == @board[3 + i] && @board[3 + i] == @board[6 + i]
    end
    if @board[0] == @board[4] && @board[4] == @board[8]
      answer = true
    elsif @board[6] == @board[4] && @board[4] == @board[2]
      answer = true
    end

    answer
  end
end
