class View
  def draw_frame(grid)
    limit = grid.columns
    counter = 1
    grid.cells.each do |cell|
      if counter%limit != 0
        print visual_cell(cell)
      else
        puts visual_cell(cell)
      end
      counter += 1
    end
  end

  def visual_cell(cell)
    cell.alive? ? '#' : ' '
  end
end
