class_name Player
extends Character

var _deck:Array[CardSpec]
var _discard_pile:Array[CardSpec]
@onready var _hand := $Hand  # Hand of cards
@onready var _enemy := $"../Enemy"


func _update_card(card:Card, spec:CardSpec):
	# Use the given spec to update the card's attributes
	card.month = spec.month
	card.type = spec.type
	card.synergy = spec.synergy
	card.texture = spec.texture


func _draw_cards(num_draw:int):
	if _hand.num_cards + num_draw > _hand.max_hand_size:
		# Clamp upper limit of num cards to draw
		# TODO debuff variable possibly
		num_draw = _hand.max_hand_size - _hand.num_cards
	
	# Update the displayed cards
	var card_nodes := _hand.get_node("GridContainer").get_children()
	
	# Shortcut by simply updating the existing Card nodes with the newly "drawn" cards
	for card in card_nodes:
		# Finished drawing cards
		if num_draw == 0:
			break
		
		# This spot is already filled with a card
		if card.type != CardSpec.Type.EMPTY:
			continue
		
		# Empty spot
		if not _deck.is_empty():
			# Draw a non-empty card and update the current card node
			_update_card(card, _deck.pop_back())
			_hand.num_cards += 1
			num_draw -= 1


func _play_cards():
	var card_nodes := _hand.get_children()
	var selected_cards:Array[CardSpec]
	
	for card in card_nodes:
		if card.is_selected:
			# Extract the spec form of the card
			var spec_version := CardSpecFactory.card_to_spec(card)
			
			selected_cards.push_back(spec_version)
			_discard_pile.push_back(spec_version)  # Will enter the discard pile shortly after being played
			
			_update_card(card, CardSpecFactory.empty_card_spec)
			
			# Deselect the card since we will play it now
			_hand.num_cards -= 1
			card.is_selected = false
	
	var dmg = DamageEngine.calc_dmg(selected_cards)
	signals.character_hit.emit(_enemy, dmg)
	signals.switch_battle_phase.emit()
	# TODO possibly a replenish_deck() to move the discard to the deck, and shuffle also
