class_name Deck
extends Node

var deck:Array[CardSpec]
var curr_specs:Array

var month:CardSpec.Month
var type:CardSpec.Type
var synergy:CardSpec.Synergy
var texture:Texture2D

func deck_creator()-> Array[CardSpec]:
	
	# Access the CSV file containing the cards in the deck
	var deck_file = FileAccess.open("res://assets/DeckCSV.csv", FileAccess.READ)
	
	# Go through each row in the file and create a CardSpec object from it
	while !deck_file.eof_reached():
		curr_specs = Array(deck_file.get_csv_line())
		month = int(curr_specs[0])
		type = int(curr_specs[1])
		synergy = int(curr_specs[2])
		#texture = curr_specs[3]
		# TODO: instead of preloading temp properly load in the sprite name
		var curr_card:CardSpec = CardSpec.new(month, type, synergy, preload("res://assets/temp.png"))
		deck.append(curr_card)
	deck_file.close()
		
	return deck
	
