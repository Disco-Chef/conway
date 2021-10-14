class Cell
  attr_reader :will_live, :y_position, :x_position

  def initialize(y_position, x_position, grid, alive)
    @alive = alive
    @will_live = nil
    @x_position = x_position
    @y_position = y_position
    @grid = grid
  end

  def alive?
    @alive
  end

  def live_neighbours_count
    neighbouring_cells.count { |cell| cell.alive? == true }
  end

  def neighbouring_cells
    neighbours = []
    # Check in 8 directions
    if valid_neighbour?(@y_position - 1, @x_position - 1)
      neighbours << @grid.cells_in_grid[@y_position - 1][@x_position - 1]
    end
    if valid_neighbour?(@y_position - 1, @x_position)
      neighbours << @grid.cells_in_grid[@y_position - 1][@x_position]
    end
    if valid_neighbour?(@y_position - 1, @x_position + 1)
      neighbours << @grid.cells_in_grid[@y_position - 1][@x_position + 1]
    end
    if valid_neighbour?(@y_position, @x_position - 1)
      neighbours << @grid.cells_in_grid[@y_position][@x_position - 1]
    end
    if valid_neighbour?(@y_position, @x_position + 1)
      neighbours << @grid.cells_in_grid[@y_position][@x_position + 1]
    end
    if valid_neighbour?(@y_position + 1, @x_position - 1)
      neighbours << @grid.cells_in_grid[@y_position + 1][@x_position - 1]
    end
    if valid_neighbour?(@y_position + 1, @x_position)
      neighbours << @grid.cells_in_grid[@y_position + 1][@x_position]
    end
    if valid_neighbour?(@y_position + 1, @x_position + 1)
      neighbours << @grid.cells_in_grid[@y_position + 1][@x_position + 1]
    end
    return neighbours
  end

  def valid_neighbour?(neighbour_y, neighbour_x)
    !neighbour_y.negative? &&
      !neighbour_x.negative? &&
      !(neighbour_x > @grid.rows - 1) &&
      !(neighbour_y > @grid.columns - 1)
  end

  def assess_future_state
    live_neighbours = self.live_neighbours_count
    puts "SELFCell Y:#{@y_position} X:#{@x_position}"
    neighbouring_cells.each do |cell|
      puts "NeighbourCell Y:#{cell.y_position} X:#{cell.x_position}"
    end
    puts "-----"
    # alive cell
    if self.alive?
      if live_neighbours < 2 || live_neighbours > 3
        @will_live = false
      else
        @will_live = true
      end
    else # dead cell
      if live_neighbours == 3
        @will_live = true
      else
        @will_live = false
      end
    end
  end

  def become_next_state
    @alive = @will_live
  end
end
