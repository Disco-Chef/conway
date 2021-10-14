require_relative 'cell'

class Grid
  attr_reader :columns, :rows, :cells_in_grid

  # @cells_in_grid[y][x]
  # #X:0,1
  # [       #Y
  #   [ , ],#0
  #   [ , ] #1
  # ]

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @cells_in_grid = Array.new(rows, Array.new(columns))
    create_cells
  end

  def create_cells
    @cells_in_grid.each_with_index do |row, y|
      row.each_with_index do |_, x|
        puts "Y: #{y}, X: #{x}"
        p cell = Cell.new(y, x, self, [true, false].sample)
        # This 👇 seems like it's putting the same cell in two spots of the grid. For position (Y:0, X:0) and (Y:1, X:0) the same cell🤦‍♂️
        @cells_in_grid[y][x] = cell
        p @cells_in_grid
      end
    end
  end
end
