require_relative 'grid'
require_relative 'game_of_life'

grid = Grid.new(45, 100)

game = GameOfLife.new(grid)

game.run
