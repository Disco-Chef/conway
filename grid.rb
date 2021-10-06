require_relative 'cell'

class Grid
  attr_reader :cells

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @cells = []
    create_cells
  end

  def create_cells
    @columns.times do |y|
      @rows.times do |x|
        cell = Cell.new(x, y, self, [true, false].sample) # yes, will result in unstable conway game, but that's not the point, yet
        @cells << cell
      end
    end
  end
end
