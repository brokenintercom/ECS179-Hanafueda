class_name Deck
extends CardPile


func _init() -> void:
	_cards.append(CardSpec.new(CardSpec.Month.JAN, CardSpec.Type.BRIGHT, CardSpec.Synergy.NONE, load("res://assets/temp_bright_jan.png")))
	_cards.append(CardSpec.new(CardSpec.Month.JAN, CardSpec.Type.RIBBON, CardSpec.Synergy.POETRY_RIBBON, load("res://assets/temp_ribbon_jan.png")))
	_cards.append(CardSpec.new(CardSpec.Month.JAN, CardSpec.Type.NORMAL, CardSpec.Synergy.NONE, load("res://assets/temp_normal_1_jan.png")))
	_cards.append(CardSpec.new(CardSpec.Month.JAN, CardSpec.Type.NORMAL, CardSpec.Synergy.NONE, load("res://assets/temp_normal_2_jan.png")))
	_cards.append(CardSpec.new(CardSpec.Month.FEB, CardSpec.Type.NORMAL, CardSpec.Synergy.NONE, load("res://assets/temp_feb_normal.jpeg")))
	# TODO for testing, pretend January has 3 normals
	_cards.append(CardSpec.new(CardSpec.Month.JAN, CardSpec.Type.NORMAL, CardSpec.Synergy.NONE, load("res://assets/temp_normal_2_jan.png")))

	#TODO bring back this deck initialization later
	## Access the CSV file containing the cards in the deck
	#var deck_file = FileAccess.open("res://assets/DeckCSV.csv", FileAccess.READ)
	#
	## Go through each row in the file and create a CardSpec object from it
	#while !deck_file.eof_reached():
		#var curr_specs := Array(deck_file.get_csv_line())
		#var month:CardSpec.Month = int(curr_specs[0]) as CardSpec.Month
		#var type:CardSpec.Type = int(curr_specs[1]) as CardSpec.Type
		#var synergy:CardSpec.Synergy = int(curr_specs[2]) as CardSpec.Synergy
		#var texture:Texture2D = load("res://assets/" + curr_specs[3] + ".png")
		#
		#var curr_card_spec:CardSpec = CardSpec.new(month, type, synergy, texture)
		#_cards.append(curr_card_spec)
	#
	#deck_file.close()


func shuffle() -> void:
	_cards.shuffle()


func is_empty() -> bool:
	return _cards.is_empty()


func draw_card() -> CardSpec:
	if is_empty():
		print("returning empty spec...")
		return CardSpecFactory.empty_card_spec
	
	return _cards.pop_back()
