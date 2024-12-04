class_name Player
extends Character

const WHITE = Color.WHITE
const GRAY = Color.WEB_GRAY

var selected_cards:Array[CardSpec]  # TODO it would be nice if this could be CardPile too, but then you have to define iterator and indexing...
var deck := Deck.new()
var _discard_pile:Array[CardSpec]
var ino_shika_cho_active := false

@onready var hand := %Hand  # Hand of cards


func _ready():
	signals.player_hit.connect(_on_player_hit)
	signals.player_recover_hp.connect(_on_player_recover_hp)
	
	# Set up effects
	heal_eff = HealEffect.new()
	atk_buff_eff = AttackBuffEffect.new()
	block_eff = BlockEffect.new()


	print("PLAYER READY -- ", hand.get_node("GridContainer/Card0"))
	
	health_bar.init_health(max_health)
	print("player starting health ", max_health)

	super()


func draw_cards(num_draw:int):
	num_draw = clampi(num_draw, 0, hand.max_hand_size - hand.num_cards)
	print("Attempting to draw %d cards..." % num_draw)
	
	var card_nodes := hand.get_node("GridContainer").get_children()
	
	# Update the displayed cards
	# Shortcut by simply updating the existing Card nodes with the newly "drawn" cards
	for card in card_nodes:
		# Finished drawing cards
		if num_draw == 0:
			break
		
		# This spot is already filled with a card
		if not card.is_empty():
			continue
		
		# This spot is an empty spot -- we want to fill in with a card from deck
		# Draw a non-empty card and update the current card node
		if _draw_card(card):
			# Successfully drew a card
			num_draw -= 1
	
	print("deck length:", len(deck._cards))


func play_cards() -> void:
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
			# Extract the spec form of the card
			var spec_version := CardSpecFactory.card_to_spec(card)
			
			_discard_pile.append(spec_version)  # Will enter the discard pile shortly after being played
			
			card.get_curr_card_state().transition_to_empty()  # Change this card to empty state
			# TODO could turn the above line inton another wrapper function
			
			# Deselect the card since we will play it now
			hand.num_cards -= 1
		else:
			# Update the card's state
			var curr_card_state:CardState = card.get_curr_card_state()
			
			# Matches the category -- transition to ENABLED state as needed
			if curr_card_state.state == CardState.State.DISABLED:
				curr_card_state.transition_to_enabled()
	
	super()


func _attack() -> void:
	print("Player attacking...")
	if ino_shika_cho_active:
		print("Applying ino_shika_cho synergy from previous turn...")
		atk_buff_eff.apply(self, 2.0)
		ino_shika_cho_active = false
	
	var dmg = DamageEngine.calc_dmg(selected_cards, hand.category_match, atk_multiplier)

	signals.enemy_hit.emit(dmg)


func _apply_synergy() -> void:
	var num_selected := len(selected_cards)
	
	# TODO may have to modify if no longer synergies that are only 3 cards
	if num_selected != CardSpec.MAX_SYNERGY_CARDS:
		return
	
	var synergy_to_match := selected_cards[0].synergy
	print("synergy_to_match: ", CardSpec.Synergy.keys()[synergy_to_match])
	
	for i in range(1, num_selected):
		# TODO there's no matches_syergy for CardSpec, only for Card
		if not selected_cards[i].synergy == synergy_to_match:
			print("No synergy")
			return
	

	match synergy_to_match:
		CardSpec.Synergy.BLUE_RIBBON:
			print("BLUE RIBBON SYNERGY: nullify damage")
			block_eff.apply(enemy, 0.0)
		CardSpec.Synergy.POETRY_RIBBON:
			print("POETRY RIBBON SYNERGY: heal 20% of health back, with floor for integer values")
			heal_eff.apply(self, 0.2)
		CardSpec.Synergy.INO_SHIKA_CHO:
			print("INO SHIKA CHO SYNERGY: apply x2 damage for *next* attack")  # TODO player's next turn
			ino_shika_cho_active = true



func _draw_card(card:Card) -> bool:
	# Double-check before trying to taking an element from the deck
	# Return whether or not drawing the card was successful
	if deck.is_empty():
		return false
	
	var new_card = deck.draw_card()
	
	# Fill in empty spot with the new card spec
	if card.is_empty():
		card.get_curr_card_state().transition_to_enabled(new_card)
		
	hand.num_cards += 1
	
	return true


func _on_player_hit(dmg:int) -> void:
	# Internally update health
	print("Before player hit: ", curr_health)
	curr_health = clampi(curr_health - dmg, 0, max_health)
	health_bar.update_health(curr_health)
	print("After player hit: ", curr_health)


func _on_player_recover_hp(amount:float) -> void:
	if 0.0 < amount and amount < 1.0:
		# Increase by integer amount, not float
		print("Before player heal: ", curr_health)
		curr_health = clampi(curr_health * (1.0 + amount), curr_health, max_health)
		health_bar.health = curr_health
		print("After player heal: ", curr_health)


func reset() -> void:
	# Update health
	super()
	
	# Update hand
	hand.max_hand_size = 8
	hand.num_cards = 0
	hand.category_match = Hand.Match.NONE
	hand.running_month = CardSpec.Month.NONE
	hand.running_type = CardSpec.Type.NONE
	hand.visible = false
	
	var card_nodes := hand.get_node("GridContainer").get_children()
	
	for card in card_nodes:
		if not card.is_empty():
			card.get_curr_card_state().transition_to_empty()
	
	# Update deck
	deck = Deck.new()
	
