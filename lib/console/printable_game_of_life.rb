class PrintableGameOfLife < GameOfLife
  private

  def create_board
    PrintableBoard.new(size: board_size) { PrintableCell.new(state: :dead) }
  end

  def execute_round!(generation)
    system "clear"
    puts "Generation ##{generation} ---------------"
    print "\n"
    board.paint!
    print "\n\n"
    sleep 0.7
    super(generation)
  end
end
