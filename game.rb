require_relative 'grid'
require_relative 'game_of_life'

grid = Grid.new(10, 10)

game = GameOfLife.new(grid)

game.run
