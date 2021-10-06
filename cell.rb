class Cell
  def initialize(x_position, y_position, grid, alive)
    @alive = alive
    @will_live = nil
    @x_position = x_position
    @y_position = y_position
    @grid = grid
  end

  def live_neighbours_count
    neighbouring_cells.count(&:alive)
  end

  def neighbouring_cells
    # 8 total max, 3 min if corner
    # Yes, corner. Not too sure if I got the theory behind an infinite grid yet

    # corner means (x/y_position - 1).negative? || ((y_position + 1) > self.grid.rows || (x_position + 1) > self.grid.columns))

    # return array of neighbouring cells
  end

  def will_live?
    # self.live_neighbours_count
    # returns true or false based on the rules of Life for that cell instance
  end

  def become_next_state
    @alive = @will_live
  end
end
