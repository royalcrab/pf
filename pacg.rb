


class CommonCardMaster
	@name
	@type
	@text
	@check_list
	def initialize( name, type, text, check_list )
	end
end

class CommonCard
	@master
	@owner
end

class CharacterCardMaster
	@name
	@classname
end

char_decks = []

char_decks[0] = [] # Fighter
char_decks[1] = []
char_decks[2] = []

location_decks = []

location_decks[0] = []
location_decks[1] = []
location_decks[2] = []
location_decks[3] = []
location_decks[4] = []

class Game

	@players
	@locations
	@location_cards
	@location_decks

	@common_cards

	@blessings
	@blessings_discards

	@player_decks
	@player_hands
	@player_buried
	@player_discards

	@characters	

	@running

	def init_senario

		@senario = {}
		@senario["Name"] = "BRIGANDOOM!"
		@senario["Text"] = ""

		@players = ["VALEROS", "EZREN", "MERISIEL"]
		@locations = ["WOODS", "ACADEMY", "WATERFRONT", "FARM HOUSE", "WOODEN BRIDGE"]
		@bosses = ["JUBRAYL VHISKI","BANDIT","BANDIT","BANDIT","BANDIT","BANDIT","BANDIT","BANDIT"]

		@common_cards = {}

		@common_cards["Long Sword"] = {}
		@common_cards["Short Sword"] = {}

		@location_decks = {}
		@location_cards = {}

		@location_cards["WOODS"] = {
			"Monster" => 4,
			"Barrier" => 2,
			"Weapon" => 1,
			"Spell" => 0,
			"Armor" => 0,
			"Item" => 2,
			"Ally" => 0,
			"Blessing" => 0,
			"AtThislocation" => "",
			"WhenClosing" => "",
			"WhenPermanentlyClosed" => "",
			"Closing" => "none"
		}

		@location_cards["FARM HOUSE"] = {
			"Monster" => 4,
			"Barrier" => 2,
			"Weapon" => 1,
			"Spell" => 0,
			"Armor" => 0,
			"Item" => 2,
			"Ally" => 0,
			"Blessing" => 0,
			"AtThislocation" => "",
			"WhenClosing" => "",
			"WhenPermanentlyClosed" => "",
			"Closing" => "none"
		}

		@location_cards["ACADEMY"] = {
			"Monster" => 4,
			"Barrier" => 2,
			"Weapon" => 1,
			"Spell" => 0,
			"Armor" => 0,
			"Item" => 2,
			"Ally" => 0,
			"Blessing" => 0,
			"AtThislocation" => "",
			"WhenClosing" => "",
			"WhenPermanentlyClosed" => "",
			"Closing" => "none"
		}

		@location_cards["WATERFRONT"] = {
			"Monster" => 4,
			"Barrier" => 2,
			"Weapon" => 1,
			"Spell" => 0,
			"Armor" => 0,
			"Item" => 2,
			"Ally" => 0,
			"Blessing" => 0,
			"AtThislocation" => "",
			"WhenClosing" => "",
			"WhenPermanentlyClosed" => "",
			"Closing" => "none"
		}

		@location_cards["WOODEN BRIDGE"] = {
			"Monster" => 4,
			"Barrier" => 2,
			"Weapon" => 1,
			"Spell" => 0,
			"Armor" => 0,
			"Item" => 2,
			"Ally" => 0,
			"Blessing" => 0,
			"AtThislocation" => "",
			"WhenClosing" => "",
			"WhenPermanentlyClosed" => "",
			"Closing" => "none"
		}

=begin		
		@location_cards["WOODS"]["Monster"] = 4
		@location_cards["WOODS"]["Barrier"] = 2
		@location_cards["WOODS"]["Weapon"] = 1
		@location_cards["WOODS"]["Spell"] = 0
		@location_cards["WOODS"]["Armor"] = 0
		@location_cards["WOODS"]["Item"] = 2
		@location_cards["WOODS"]["Ally"] = 0										
		@location_cards["WOODS"]["Blessing"] = 0
		@location_cards["WOODS"]["AtThislocation"] = ""
		@location_cards["WOODS"]["WhenClosing"] = ""
		@location_cards["WOODS"]["WhenPermanentlyClosed"] = ""
=end

		@locations.each do |location|
			@location_decks[location] = [
				"Monster","Monster","Barrier","Item","Spell",
				"Weapon","Blessing","Armor","Ally",
			]
		end

		location_numbers = [0,1,2,3,4]
		shuffle( location_numbers )
		location_numbers.each do |number|
			@location_decks[@locations[number]].push(@bosses[number])
		end
		@location_decks.each do |deck|
			shuffle( deck )
		end
#		p location_numbers

		@blessings = [ 
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
		]

		@blessings_discards = []
		@player_decks = {}

		@player_decks["VALEROS"] = [
		   "Long Sword", "Long Sword", "Dagger", "Short Sword", "Mace", 
			"Chain Mail", "Wooden Sheild", "Wooden Sheild", 
			"Night Watch", "Standard Bearer",
			"Blessing of the Gods", "Blessing of the Gods", "Blessing of the Gods", 
			"Blessing of the Gods", "Blessing of the Gods"
		]

		@player_decks["EZREN"] = [
			"Quarterstaff",
			"Arcane Armor", "Detect Magic", "Force Missile", "Invisibility",
			"Levitate", "Lightning Touch", "Lightning Touch", "Sleep",
			"Blast Stone", "Bracers of Protection", "Codex",
			"Night Watch", "Sage", "Standard Bearer"
		]

		@player_decks["MERISIEL"] = [
			"Dagger", "Dart",
			"Leather Armor",
			"Caltrops", "Crowbar", "Potion of Glibness", "Potion of Vision",
			"Theives' Tools", "Theives' Tools", 
			"Burglar", "Guard",
			"Blessing of the Gods", "Blessing of the Gods",
			"Blessing of the Gods", "Blessing of the Gods",
		]

		@player_hands = {}

		@player_hands["VALEROS"] = []
		@player_hands["EZREN"] = []
		@player_hands["MERISIEL"] = []

		@player_buried = {}

		@player_buried["VALEROS"] = []
		@player_buried["EZREN"] = []
		@player_buried["MERISIEL"] = []


		@characters = {}

		@characters["VALEROS"] = {}
		@characters["VALEROS"]["handsize"] = 4

		@characters["EZREN"] = {}
		@characters["EZREN"]["handsize"] = 6

		@characters["MERISIEL"] = {}
		@characters["MERISIEL"]["handsize"] = 5

		@token_cards = {}

=begin
		@token_cards["VALEROS"] = {}
		@token_cards["EZREN"] = {}
		@token_cards["MERISIEL"] = {}		

		@token_cards["VALEROS"]["location"] = "WOODS"
		@token_cards["EZREN"]["location"] = "WOODS"
		@token_cards["MERISIEL"]["location"] = "WOODS"				
=end

		@token_cards["VALEROS"] = {
			"location" => "ACADEMY"
		}

		@token_cards["EZREN"] = {
			"location" => "ACADEMY"
		}

		@token_cards["MERISIEL"] = {
			"location" => "WOODS"
		}

	end

	def shuffle( deck )
		count = deck.size * deck.size
		while count > 0
			a = rand(deck.size)
			b = rand(deck.size)
			deck[a],deck[b] = deck[b],deck[a]
			count -= 1
		end
	end

	def draw( deck, hand, num )
		while num > 0
			if deck.size < 1
				print "Empty!!\n"
				return nil
			end
			hand.push deck.pop
			num -= 1
		end
	end

	def show_deck( player )
		print "[",@player_decks[player].join(','), "]\n"
	end

	def show_hand( player )
		print "#{player}'s Hand"
		@player_hands[player].each_index do |index|
			print "[#{index}: #{@player_hands[player][index]}]"
		end
		print "\n"
#		print "[",@player_hands[player].join(','), "]\n"
	end

	def show_opened_locations
		result = []
		@locations.each_index do |index|
#			print @locations[index], "\t"
			if @location_cards[@locations[index]]["Closing"] == "none"
				print "[#{index}: #{@locations[index]}] "
				result.push @locations[index]
			end
		end
		print "\n"
		result
	end

	def show_players( location )
		print "Players: "
#		print "Players: <#{location}>"
		@players.each_index do |index|
			print "[#{index}: #{@players[index]}] " if location == @token_cards[@players[index]]["location"] || location == nil
		end
		print "at location: #{location}" if location != nil
		print "\n"
	end

	def init_game

		self.init_senario

		@player_decks.each_key do |key|
			print key,"\n"
			shuffle( @player_decks[key] )
			draw( @player_decks[key], @player_hands[key], @characters[key]["handsize"])
			#show_deck( key )
#			show_hand( key )	
		end

		@location_decks.each_key do |key|
			shuffle( @location_decks[key] )
#			p @location_decks[key]
		end



=begin
		draw( @player_decks["VALEROS"] , @player_hands["VALEROS"] , 4)
		show_hand( @player_hands["VALEROS"])

		draw( @player_decks["EZREN"]   , @player_hands["EZREN"]   , 6)
		show_hand( @player_hands["EZREN"])

		draw( @player_decks["MERISIEL"], @player_hands["MERISIEL"], 5)
		show_hand( @player_hands["MERISIEL"])
=end

	end

	def explore(player, current_location)
		if @location_decks[current_location].size < 1
			print "No more cards at #{current_location}!! You can not explore this location.\n"
			return false
		end
		encounter_card = @location_decks[current_location].pop
		print "You will encounter [#{encounter_card}]\n"

	end

	def main_loop
		@running = true
		@turn_number = 0
		while @running do

			@players.each do |player|
				@turn_number += 1
				current_location = @token_cards[player]["location"]

				print "-----------------------------------------\n"
				print "Senario: #{@senario["Name"]}\n"
				print "Turn [#{@turn_number}]: #{player}'s Turn.\n"
				print "Unclosed locations: "
				show_opened_locations		
#				@location_cards.each_key do |key|
#					print " [#{key}]: unless @location_cards[key]["Closing"]
#				end
				print "\n"

				# blessings 
				print "%%% Advance the Blessings deck %%%\n"
				if @blessings.size < 1
					print "No more blessings!\n"
					print "You lose the game....\n\n"
					@running = false
					break
				else
					discard_tmp = @blessings.pop
					@blessings_discards.push( discard_tmp )
					print "[#{discard_tmp}] is discarded.\n"
					print "#{@blessings.size} cards are remained in the blessings deck.\n\n"
				end

#				print "#{player}" "


				# giving a card to another player

				print "[[[[ GIVING phase ]]]]\n"
				show_hand(player)
#				p @token_cards[player]
#				@token_cards[player].each_key do |key| 
#					print "[",key,"]\n"
#					print "[location]\n"
#					print "OK" if key == "location"
#					print @token_cards[player][key],"\n"
#					print @token_cards[player]["location"],"\n"
#				end
				show_players( current_location )
				print "\n"

				print "*** Do you give a card to another player? [y/N]\n"
				buf = gets
				if buf =~ /y/
					print "OK, giving!\n\n"
				else
					print "Pass\n\n"
				end

				# move to another location

				print "[[[[ MOVING phase ]]]]\n"
				print "Your location: #{current_location}\n"
				location_list = show_opened_locations
				print "\n"

				print "*** Do you move to another location? [0-#{location_list.size-1}]\n"
				buf = gets
				if buf =~ /(\d+)/
					if $1.to_i > 0 && $1.to_i < location_list.size
						print "OK, moving!\n\n"
						@token_cards[player]["location"] = @locations[$1.to_i]
						current_location = @token_cards[player]["location"]
						print "Your (#{player}) location is changed to #{current_location}.\n"
					end
				else
					print "Pass\n\n"
				end

				# explorer

				print "*** Do you explore? [y/N]\n"
				buf = gets
				if buf =~ /y/
					print "OK, exploring! --------------------------------- \n\n"
					explore(player,current_location)
				else
					print "Pass\n\n"
				end

				# closing current location
				if @location_decks[current_location].size == 0
					print "No more location cards at #{current_location}\n"
				end
				print "*** Do you close current location? [y/N]\n"
				buf = gets
				if buf =~ /y/
					print "OK, closing!\n\n"
				else
					print "Pass\n\n"
				end

				# refresh

				print "*** Refresh your hand. ***\n"
			end # playser.each

			if @players.size == 0
				print "All players die !!\n"
				@running = false

			end

		end # while

	end #main_loop

end #class

game = Game.new
game.init_game
game.main_loop
