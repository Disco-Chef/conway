require_relative 'view'

class GameOfLife
  def initialize(grid)
    @grid = grid
    @view = View.new
  end

  def run
    @view.clear_frame
    loop do
      @view.draw_frame(@grid)
      @view.how_to_stop_message
      sleep(0.25)
      @view.clear_frame

      @grid.cells_in_grid.each do |row|
        row.each(&:assess_future_state!)
      end

      @grid.cells_in_grid.each do |row|
        row.each(&:become_next_state!)
      end
    end
  end
end
