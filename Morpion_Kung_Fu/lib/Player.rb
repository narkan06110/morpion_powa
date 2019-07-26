require'bundler'
Bundler.require

require_relative 'Board'
require_relative 'Game'

class Player

  attr_accessor :name, :form
  def initialize(name, form, board)
    @name = name
    @form = form
    @board = board
  end

  def move(cell)
    @board.update_cell(cell, self.form)
  end

  def winner? #Verifie toute les combinaison gagnante dans l'array
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    wins.each do |win|
    values = [cells[win[0]], cells[win[1]], cells[win[2]]]
      return true if values.include?(self.form.to_s) &&
      ((values[0] == values[1]) && (values[1] == values[2]))
  end
  false
end

  private

  def cells
    @board.cells
  end

end