class Cell
  attr_reader :will_live, :y_position, :x_position

  def initialize(y_position, x_position, grid, alive)
    @alive = alive
    @will_live = nil
    @x_position = x_position
    @y_position = y_position
    @grid = grid
  end

  def neighbouring_cells
    neighbours = []
    [-1, 0, 1].each do |y_diff|
      next if invalid_y_position?(@y_position + y_diff)

      [-1, 0, 1].each do |x_diff|
        next if invalid_x_position?(@x_position + x_diff) ||
                neighbour_is_self?(@y_position + y_diff, @x_position + x_diff)

        neighbour_cell = @grid.cells_in_grid[@y_position + y_diff][@x_position + x_diff]
        neighbours << neighbour_cell
      end
    end
    neighbours
  end

  def alive?
    @alive
  end

  def invalid_y_position?(neighbour_y)
    neighbour_y.negative? || neighbour_y >= @grid.rows
  end

  def invalid_x_position?(neighbour_x)
    neighbour_x.negative? || neighbour_x >= @grid.columns
  end

  def neighbour_is_self?(neighbour_y, neighbour_x)
    @grid.cells_in_grid[neighbour_y][neighbour_x] == self
  end

  def live_neighbours_count
    neighbouring_cells.count(&:alive?)
  end

  def assess_future_state!
    live_neighbours = live_neighbours_count

    @will_live = if alive?
                   live_neighbours < 2 || live_neighbours > 3 ? false : true
                 else
                   live_neighbours == 3
                 end
  end

  def become_next_state!
    @alive = @will_live
  end
end
