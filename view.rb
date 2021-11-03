class View
  def draw_frame(grid)
    limit = grid.columns
    counter = 1
    grid.cells_in_grid.each do |row|
      row.each do |cell|
        if counter % limit != 0
          print visual_cell(cell)
        else
          puts visual_cell(cell)
        end
        counter += 1
      end
    end
  end

  def clear_frame
    print(`clear`)
  end

  def visual_cell(cell)
    cell.alive? ? '#' : ' '
  end

  def how_to_stop_message
    puts 'To stop running the game, press Ctrl + C'
  end
end
