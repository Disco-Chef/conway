require_relative 'view'

class GameOfLife
  def initialize(grid)
    @grid = grid
    @view = View.new
  end

  def run
    puts "========="
    loop do
      @view.draw_frame(@grid)
      sleep(1)
      puts "========="

      @grid.cells_in_grid.each do |row|
        row.each do |cell|
          cell.assess_future_state
        end
      end

      @grid.cells_in_grid.each do |row|
        row.each do |cell|
          cell.become_next_state
        end
      end
      # @grid.cells.each do |cell|
      #   cell.assess_future_state
      # end

      # @grid.cells.each do |cell|
      #   cell.become_next_state
      # end
    end
  end
end
