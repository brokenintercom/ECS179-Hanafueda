class_name Player
extends Character

const WHITE = Color.WHITE
const GRAY = Color.WEB_GRAY

var selected_cards:Array[CardSpec]  # TODO it would be nice if this could be CardPile too, but then you have to define iterator and indexing...
var _deck := Deck.new()
var _discard_pile:Array[CardSpec]

@onready var hand := %Hand  # Hand of cards


func _ready():
	# Shuffle the deck
	_deck.shuffle()
	print("PLAYER READY -- ", hand.get_node("GridContainer/Card0"))
	super()


func draw_cards(num_draw:int):
	num_draw = clampi(num_draw, 0, hand.max_hand_size - hand.num_cards)
	print("Drawing %d cards..." % num_draw)
	
	var card_nodes := hand.get_node("GridContainer").get_children()
	
	# Update the displayed cards
	# Shortcut by simply updating the existing Card nodes with the newly "drawn" cards
	for card in card_nodes:
		# Finished drawing cards
		if num_draw == 0:
			break
		
		# This spot is already filled with a card
		if card.type != CardSpec.Type.NONE:
			continue
		
		# This spot is an empty spot -- we want to fill in with a card from deck
		# Draw a non-empty card and update the current card node
		if _draw_card(card):
			# Successfully drew a card
			num_draw -= 1
	
	print("_deck length:", len(_deck._cards))


func play_cards() -> void:
	print("Playing cards...")
	# Actually use the selected cards to perform the attack on the enemy
	_attack()
	_apply_synergy()  # Synergies are applied right before the end of the turn
	
	_cleanup()
	# TODO possibly a replenish_deck() to move the discard to the deck, and shuffle also


func _cleanup() -> void:
	var card_nodes := hand.get_node("GridContainer").get_children()
	
	# Handle the selected cards
	for card in card_nodes:
		if card.is_selected():
			print("playing the card...")
			# Extract the spec form of the card
			var spec_version := CardSpecFactory.card_to_spec(card)
			
			_discard_pile.append(spec_version)  # Will enter the discard pile shortly after being played
			
			card.get_curr_card_state().transition_to_empty()  # Change this card to empty state
			# TODO could turn the above line inton another function
			
			# Deselect the card since we will play it now
			hand.num_cards -= 1
	
	print("_selected_cards should be empty:", selected_cards)
	print("_discard_pile:", _discard_pile)
	
	super()


func _attack() -> void:
	print("attacking...")
	var dmg = DamageEngine.calc_dmg(selected_cards, hand.category_match, atk_multiplier)
	signals.character_hit.emit(enemy, dmg)


func _apply_synergy() -> void:
	var num_selected := len(selected_cards)
	
	# TODO may have to modify if no longer synergies that are only 3 cards
	if num_selected != CardSpec.MAX_SYNERGY_CARDS:
		return
	
	var synergy_to_match := selected_cards[0].synergy
	print("synergy_to_match: ", synergy_to_match)
	
	for i in range(1, num_selected):
		if not selected_cards[i].matches_synergy(synergy_to_match):
			print("No synergy")
			return
	
	match synergy_to_match:
		CardSpec.Synergy.BLUE_RIBBON:
			print("BLUE RIBBON SYNERGY: nullify damage")  # TODO enemy's next turn
			enemy.atk_multiplier = 0.0
		CardSpec.Synergy.POETRY_RIBBON:
			print("POETRY RIBBON SYNERGY: heal 20% of health back, with floor for integer values")
			signals.recover_hp.emit(self, 0.2)
		CardSpec.Synergy.INO_SHIKA_CHO:
			print("INO SHIKA CHO SYNERGY: apply x2 damage for next attack")  # TODO player's next turn
			atk_multiplier = 2.0


func _draw_card(card:Card) -> bool:
	# Double-check before trying to taking an element from the deck
	# Return whether or not drawing the card was successful
	if _deck.is_empty():
		return false
	
	var new_card = _deck.draw_card()
	
	# Fill in empty spot with the new card spec
	if card.is_empty():
		card.get_curr_card_state().transition_to_enabled(new_card)
		
	hand.num_cards += 1
	
	return true
