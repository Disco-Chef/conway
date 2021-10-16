require_relative 'cell'

class Grid
  attr_reader :columns, :rows, :cells_in_grid

  # @cells_in_grid[y][x]
  #   X0,X1
  # [
  #   [ , ],#Y0
  #   [ , ] #Y1
  # ]

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @cells_in_grid = Array.new(@rows) { Array.new(@columns) }
    create_cells
  end

  def create_cells
    @cells_in_grid.each_with_index do |row, y|
      row.each_with_index do |_, x|
        # puts "Y: #{y}, X: #{x}"
        cell = Cell.new(y, x, self, [true, false].sample)
        @cells_in_grid[y][x] = cell
        @cells_in_grid
      end
    end
  end
end
