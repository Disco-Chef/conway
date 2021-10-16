require_relative 'view'

class GameOfLife
  def initialize(grid)
    @grid = grid
    @view = View.new
  end

  def run
    print(`clear`)
    loop do
      @view.draw_frame(@grid)
      sleep(0.25)
      print(`clear`)

      @grid.cells_in_grid.each do |row|
        row.each(&:assess_future_state)
      end

      @grid.cells_in_grid.each do |row|
        row.each(&:become_next_state)
      end
    end
  end
end
