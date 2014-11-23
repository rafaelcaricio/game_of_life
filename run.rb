#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'game'

game_of_life = PrintableGameOfLife.new(board_size: 15, rounds: 40)

game_of_life.set_at(1, 3, PrintableCell.new(state: :alive))
game_of_life.set_at(2, 3, PrintableCell.new(state: :alive))
game_of_life.set_at(3, 2, PrintableCell.new(state: :alive))
game_of_life.set_at(3, 3, PrintableCell.new(state: :alive))
game_of_life.set_at(5, 5, PrintableCell.new(state: :alive))
game_of_life.set_at(6, 5, PrintableCell.new(state: :alive))
game_of_life.set_at(10, 5, PrintableCell.new(state: :alive))
game_of_life.set_at(10, 4, PrintableCell.new(state: :alive))
game_of_life.set_at(9, 4, PrintableCell.new(state: :alive))
game_of_life.set_at(5, 1, PrintableCell.new(state: :alive))
game_of_life.set_at(5, 4, PrintableCell.new(state: :alive))
game_of_life.set_at(2, 2, PrintableCell.new(state: :alive))

game_of_life.run!
