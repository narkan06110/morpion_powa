require'bundler'
Bundler.require

require_relative 'Player'
require_relative 'Game'

class Board
  attr_accessor :cells

  def initialize #aray servant de réference au tableau
    @cells = [
    "1", "2", "3",
    "4", "5", "6",
    "7", "8", "9"
    ]
  end

  def update_cell(number, form) # si la case est libre remplace le nombre dans le aray par le form du joueur en cours.
    if cell_free?(number)
      self.cells[number - 1] = form.to_s
      show_board
    else
      puts "Tu ne peux plus joué ici BAKA!!"
      return false
    end
  end

  def show_board #Corp du plateau
    hline = "\u2502"
    vline = "\u2500"
    cross = "\u253C"
    row1 = hline + " " + self.cells[0..2].join(" #{hline} ") + " " + hline
    row2 = hline + " " + self.cells[3..5].join(" #{hline} ") + " " + hline
    row3 = hline + " " + self.cells[6..8].join(" #{hline} ") + " " + hline
    separator =  " " + vline * 3 + cross + vline * 3 + cross + vline * 3
    system("clear")
    puts " "
    puts " "
    puts " "*50 + separator
    puts " "*50 + row1
    puts " "*50 + separator
    puts " "*50 + row2
    puts " "*50 + separator
    puts " "*50 + row3
    puts " "*50 + separator
    puts " "
    puts " "
  end

#permet de limiter cette méthode à la classe Board
  private

  def cell_free?(number) #Verifie si la place dans le array est deja occupé par une X ou un 0
    cell = self.cells[number - 1]
    if cell == "X" ||  cell == "O"
      false
    else
      true
    end
  end

end