class Player
  attr_accessor :name, :next_move, :player_symbol
  # This variable of number of players should not be higher than one. Which is why I will make it only accessible to the Game class so that nobody can increase its count beyond the desired limit.
  @@number_of_players = 0

  def initialize(name)
    @name = name
    @next_move = nil
    @player_symbol = @@number_of_players == 0 ? 'x' : 'o'
    @@number_of_players += 1
  end

  def make_move()
    @next_move = gets.chomp.to_i
  end

end
