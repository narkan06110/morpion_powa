require'bundler'
Bundler.require

require_relative 'Player'
require_relative 'Game'

class Board
  attr_accessor :cells
#Permet de mettre à jour le tableau en fonction des inputs du joueur tout en garatissant que la cellule soit vide
  def initialize
    @cells = [
    "1", "2", "3",
    "4", "5", "6",
    "7", "8", "9"
    ]
  end
#Affichage du corps du tableau (valeurs de base + lignes verticales et horizontales)
  def update_cell(number, form)
    if cell_free?(number)
      self.cells[number - 1] = form.to_s
      show_board
    else
      puts "Tu ne peux plus joué ici BAKA!!"
      return false
    end
  end
#permet de limiter cette méthode à la classe Board
#Permet de remplacer les cellules par le signe du joueur en checkant si elles
#sont vides, sinon la cellule n'est pas complétée
  def show_board
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
#Permet de remplacer les cellules par le signe du joueur en checkant si elles sont vides, sinon la cellule n'est pas complétée
  def cell_free?(number)
    cell = self.cells[number - 1]
    if cell == "X" ||  cell == "O"
      false
    else
      true
    end
  end

end