class PrintableCell < Cell
  def display_char
    return 'O' if alive?
    return '-' if dead?
  end
end
