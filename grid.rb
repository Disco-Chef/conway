require_relative 'cell'

class Grid
  attr_reader :cells, :columns, :rows, :cells_in_grid

  def initialize(columns, rows)
    @rows = rows
    @columns = columns
    @cells = []
    @cells_in_grid = Array.new(columns, Array.new(rows))
    create_cells
  end

  def row_length
    @rows.first.length
  end


  def column_length
    @columns.first.length
  end

  def create_cells
    @columns.times do |y|
      @rows.times do |x|
        cell = Cell.new(y, x, self, [true, false].sample) # yes, will result in unstable conway game, but that's not the point, yet
        @cells << cell
        @cells_in_grid[y][x] = cell
      end
    end
  end
end
