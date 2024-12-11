class_name Deck
extends CardPile


# TODO for testing synergies
func _init() -> void:
	for i in range(0, 40):
		_cards.append(CardSpec.new(CardSpec.Month.OCT, CardSpec.Type.NORMAL, CardSpec.Synergy.NONE, load("res://assets/card_sprites/" + "oct-normal-1" + ".png")))
	
	_cards.append(CardSpec.new(CardSpec.Month.JAN, CardSpec.Type.RIBBON, CardSpec.Synergy.POETRY_RIBBON, load("res://assets/card_sprites/" + "jan-tanzaku" + ".png")))
	_cards.append(CardSpec.new(CardSpec.Month.FEB, CardSpec.Type.RIBBON, CardSpec.Synergy.POETRY_RIBBON, load("res://assets/card_sprites/" + "feb-tanzaku" + ".png")))
	_cards.append(CardSpec.new(CardSpec.Month.MAR, CardSpec.Type.RIBBON, CardSpec.Synergy.POETRY_RIBBON, load("res://assets/card_sprites/" + "mar-tanzaku" + ".png")))
	
	_cards.append(CardSpec.new(CardSpec.Month.JUN, CardSpec.Type.RIBBON, CardSpec.Synergy.BLUE_RIBBON, load("res://assets/card_sprites/" + "jun-tanzaku" + ".png")))
	_cards.append(CardSpec.new(CardSpec.Month.SEP, CardSpec.Type.RIBBON, CardSpec.Synergy.BLUE_RIBBON, load("res://assets/card_sprites/" + "sep-tanzaku" + ".png")))
	_cards.append(CardSpec.new(CardSpec.Month.OCT, CardSpec.Type.RIBBON, CardSpec.Synergy.BLUE_RIBBON, load("res://assets/card_sprites/" + "oct-tanzaku" + ".png")))
	
	_cards.append(CardSpec.new(CardSpec.Month.JUN, CardSpec.Type.ANIMAL, CardSpec.Synergy.INO_SHIKA_CHO, load("res://assets/card_sprites/" + "jun-animal" + ".png")))
	_cards.append(CardSpec.new(CardSpec.Month.JUL, CardSpec.Type.ANIMAL, CardSpec.Synergy.INO_SHIKA_CHO, load("res://assets/card_sprites/" + "jul-animal" + ".png")))
	_cards.append(CardSpec.new(CardSpec.Month.OCT, CardSpec.Type.ANIMAL, CardSpec.Synergy.INO_SHIKA_CHO, load("res://assets/card_sprites/" + "oct-animal" + ".png")))


#func _init() -> void:
	## Access the CSV file containing the cards in the deck
	#var deck_file = FileAccess.open("res://resources/data/deck.csv", FileAccess.READ)
	#
	## Go through each row in the file and create a CardSpec object from it
	#while !deck_file.eof_reached():
		#var curr_specs := Array(deck_file.get_csv_line())
		#var month:CardSpec.Month = int(curr_specs[0]) as CardSpec.Month
		#var type:CardSpec.Type = int(curr_specs[1]) as CardSpec.Type
		#var synergy:CardSpec.Synergy = int(curr_specs[2]) as CardSpec.Synergy
		#var texture:Texture2D = load("res://assets/card_sprites/" + curr_specs[3] + ".png")
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
