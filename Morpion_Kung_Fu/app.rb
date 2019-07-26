
require'bundler'
Bundler.require
File.expand_path("lib/", File.dirname(__FILE__))
require_relative 'lib/Player'
require_relative 'lib/game'
require_relative 'lib/board'

class Exe
	system("clear")
	puts ""
	puts ""
	puts " " * 40 + "~" * 29
	puts " " * 40 + "|" + " " * 27 + "|"
	puts " " * 40 + "|C'est le moment de ta vie! |"
	puts " " * 40 + "|" + " " * 27 + "|"
	puts " " * 40 + "|" + " " * 9 + "ou pas..." + " " * 9 + "|"
	puts " " * 40 + "|" + " " * 27 + "|"
	puts " " * 40 + "~" * 29
	puts ""
	puts ""

	game = Game.new
	game.start_game
end
