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
    # needs refactoring. should use newer valid_neighbour
    neighbours = []
    [-1, 0, 1].each do |y_diff|
      next if (@y_position + y_diff).negative? || (@y_position + y_diff) >= @grid.columns

      [-1, 0, 1].each do |x_diff|
        next if (@x_position + x_diff).negative? || (@x_position + x_diff) >= @grid.rows || @grid.cells_in_grid[@y_position + y_diff][@x_position + x_diff] == self

        neighbour_cell = @grid.cells_in_grid[@y_position + y_diff][@x_position + x_diff]
        neighbours << neighbour_cell
      end
    end

    neighbours
  end

  def alive?
    @alive
  end

  def live_neighbours_count
    neighbouring_cells.count { |cell| cell.alive? == true }
  end

  # def valid_neighbour?(neighbour_y, neighbour_x)
  #   !neighbour_y.negative? &&
  #     !neighbour_x.negative? &&
  #     (@grid.rows - 1 <= neighbour_x) &&
  #     (@grid.columns - 1 <= neighbour_y)
  # end

  def assess_future_state
    live_neighbours = self.live_neighbours_count

    if self.alive?
      @will_live = live_neighbours < 2 || live_neighbours > 3 ? false : true
    else
      @will_live = live_neighbours == 3
    end
  end

  def become_next_state
    @alive = @will_live
  end
end
