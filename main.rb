require_relative 'Game'

g = Game.new('p1', 'p2')

while not g.did_anyone_win?
  g.make_move
end
