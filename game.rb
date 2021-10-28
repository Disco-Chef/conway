require_relative 'grid'
require_relative 'game_of_life'

grid = Grid.new(35, 150)

game = GameOfLife.new(grid)

game.run
