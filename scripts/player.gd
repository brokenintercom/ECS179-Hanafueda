class_name Player
extends Character

# TODO modify _deck to be initialized and shuffled, reading a TXT file
# TODO delete the crane card later
var _crane_card := CardSpec.new(CardSpec.Month.JAN, CardSpec.Type.ANIMAL, CardSpec.Synergy.NONE, preload("res://assets/icon.svg"))
var _deck:Array[CardSpec] = [_crane_card, _crane_card, _crane_card, _crane_card, _crane_card, _crane_card, _crane_card, _crane_card, _crane_card]
var _discard_pile:Array[CardSpec]
@onready var hand := $Hand  # Hand of cards
@onready var _enemy := $"../Enemy"


func _ready():
	# TODO initialize deck...Shuffle...
	# TODO something in the card spec factory...
	# TODO read text file, create spec, add to deck, then shuffle at the end
	super()
	pass


func draw_cards(num_draw:int):
	# Clamp upper limit of num cards to draw
	if hand.num_cards + num_draw > hand.max_hand_size:
		# TODO debuff variable possibly
		num_draw = hand.max_hand_size - hand.num_cards
	
	# Update the displayed cards
	var card_nodes := hand.get_node("GridContainer").get_children()
	
	# Shortcut by simply updating the existing Card nodes with the newly "drawn" cards
	for card in card_nodes:
		# Finished drawing cards
		if num_draw == 0:
			break
		
		# This spot is already filled with a card
		if card.type != CardSpec.Type.EMPTY:
			continue
		
		# This spot is an empty spot -- we want to fill in with a card from deck
		# Draw a non-empty card and update the current card node
		if _draw_card(card):
			# Successfully drew a card
			num_draw -= 1
	
	print("_deck:", _deck)



func play_cards():
	var card_nodes := hand.get_node("GridContainer").get_children()
	var selected_cards:Array[CardSpec]
	
	# Only play the selected cards
	for card in card_nodes:
		if card.is_selected:
			# Extract the spec form of the card
			var spec_version := CardSpecFactory.card_to_spec(card)
			
			selected_cards.push_back(spec_version)
			_discard_pile.push_back(spec_version)  # Will enter the discard pile shortly after being played
			
			card.update_card(CardSpecFactory.empty_card_spec)
			
			# Deselect the card since we will play it now
			hand.num_cards -= 1
			card.is_selected = false
	
	print("selected_cards:", selected_cards)
	print("_discard_pile:", _discard_pile)
	
	# Actually use the selected cards to perform the attack on the enemy
	_attack(selected_cards)
	
	signals.switch_battle_phase.emit()
	# TODO possibly a replenish_deck() to move the discard to the deck, and shuffle also


func _attack(selected_cards:Array[CardSpec]) -> void:
	var dmg = DamageEngine.calc_dmg(selected_cards)
	print("Damage:", dmg)
	signals.character_hit.emit(_enemy, dmg)


func _draw_card(card:Card) -> bool:
	# Double-check before trying to taking an element from the deck
	# Return whether or not drawing the card was successful
	if _deck.is_empty():
		return false
	
	# Wrapper function
	card.update_card(_deck.pop_back())
	return true
