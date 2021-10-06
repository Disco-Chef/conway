class GameOfLife
  def initialize(grid)
    @grid = grid
  end

  def run
    loop do
      @grid.cells.each do |cell|
        cell.will_live?
        cell.become_next_state
      end

      # some printed output here to view the game graphically

      # sleep(0.2) so that mortals can follow the game, even if they are not members of the Binar race (ST)
    end
  end
end
