class PrintableBoard < Board
  def paint!
    current_row = 0
    for_every_position do |position|
      if current_row != position.x
        print "\n"
        current_row = position.x
      end
      print at(position).display_char + ' '
    end
  end
end
