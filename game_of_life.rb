require_relative 'view'

class GameOfLife
  def initialize(grid)
    @grid = grid
    @view = View.new
  end

  def run
    @view.clear_frame
    loop do
      @grid.cells_in_grid
           .each { |row| row.each(&:assess_future_state!) }
           .each { |row| row.each(&:become_next_state!) }
      @view.draw_frame(@grid)
      @view.how_to_stop_message
      sleep(0.1)
      @view.clear_frame
    end
  end
end
