class_name Player
extends Character

const WHITE = Color.WHITE
const GRAY = Color.WEB_GRAY
var selected_cards:Array[CardSpec]
var deck := Deck.new()
var did_win := false
var _discard_pile:Array[CardSpec]
var _match_label:Label
var _synergy_ui:Node2D
@onready var hand := %Hand  # Hand of cards


func _ready():
	signals.battle_scene_loaded.connect(_on_battle_scene_loaded)
	signals.player_hit.connect(_on_player_hit)
	signals.player_recover_hp.connect(_on_player_recover_hp)
	
	health_bar.init_health(max_health)
	
	super()


func actions() -> void:
	_enable_player()
	
	var synergy_label = _synergy_ui.get_node("CustomLabel")
	
	if atk_multiplier == 2.0:
		synergy_label.reset_and_update_text("x2 attack this turn")
	else:
		synergy_label.reset_text()
	
	# Draw enough cards such that the player's hand would have max_hand_size 
	var num_draw:int = player.hand.max_hand_size - player.hand.num_cards
	draw_cards(num_draw)


func draw_cards(num_draw:int):
	num_draw = clampi(num_draw, 0, hand.max_hand_size - hand.num_cards)
	
	if num_draw > 0:
		_play($Audio/DrawCard)
	
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


func play_cards() -> void:
	_disable_player()
	
	# Actually use the selected cards to perform the attack on the enemy
	await _attack()
	_finish_turn()


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
	
	# Update deck. Also, don't update did_win since it affects which upcoming scenes are displayed
	deck = Deck.new()
	selected_cards.clear()
	_discard_pile.clear()
	
	_match_label.text = "Matching By: None"
	
	if _synergy_ui != null:
		_synergy_ui.get_node("CustomLabel").text = "None"


func _disable_player() -> void:
	var card_nodes := hand.get_node("GridContainer").get_children()
	
	# Make sure all enabled cards (cards the user could've selected, but didn't) become disabled
	for card in card_nodes:
		var curr_card_state:CardState = card.get_curr_card_state()
		
		if curr_card_state.state == CardState.State.ENABLED:
			curr_card_state.transition_to_disabled()


func _enable_player() -> void:
	var card_nodes := hand.get_node("GridContainer").get_children()
	
	for card in card_nodes:
		var curr_card_state:CardState = card.get_curr_card_state()
		
		if curr_card_state.state == CardState.State.DISABLED:
			curr_card_state.transition_to_enabled()


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


func _attack() -> void:
	var dmg = DamageEngine.calc_dmg(selected_cards, hand.category_match, atk_multiplier)
	
	signals.enemy_hit.emit(dmg)
	_play($Audio/Attack)
	await get_tree().create_timer(1.0).timeout


func _apply_synergy() -> void:
	var num_selected := len(selected_cards)
	var synergy_to_match := CardSpec.Synergy.NONE if num_selected == 0 else selected_cards[0].synergy
	var synergy_label = _synergy_ui.get_node("CustomLabel")
	
	if num_selected != CardSpec.MAX_SYNERGY_CARDS or synergy_to_match == CardSpec.Synergy.NONE:
		synergy_label.text = "None"
		return
	
	for i in range(1, num_selected):
		if not selected_cards[i].synergy == synergy_to_match:
			synergy_label.text = "None"
			return
	
	var text = ""
	
	match synergy_to_match:
		CardSpec.Synergy.BLUE_RIBBON:
			text = "Block enemy atk"
			block_eff.generate(enemy, 1, 0.0)
		CardSpec.Synergy.POETRY_RIBBON:
			text = "Heal 20%"
			heal_eff.generate(self, 0, 0.2)
		CardSpec.Synergy.INO_SHIKA_CHO:
			text = "x2 attack next turn"
			atk_buff_eff.generate(self, 1, 2.0)
	
	synergy_label.update_text(text)


func _finish_turn() -> void:
	_apply_synergy()  # Synergies are applied right before the end of the turn
	
	var card_nodes := hand.get_node("GridContainer").get_children()
	
	# Handle the selected cards
	for card in card_nodes:
		if card.is_selected():
			# Extract the spec form of the card
			var spec_version := CardSpecFactory.card_to_spec(card)
			
			_discard_pile.append(spec_version)  # Will enter the discard pile shortly after being played
			
			card.get_curr_card_state().transition_to_empty()  # Change this card to empty state
			
			hand.num_cards -= 1
	
	player.effect_text.reset_text()
	_match_label.text = "Matching By: None"
	
	super()


func _on_battle_scene_loaded(match_label:Label, synergy_ui:Node2D, _enemy_anim_player:AnimationPlayer) -> void:
	_match_label = match_label
	_synergy_ui = synergy_ui


func _on_player_hit(dmg:int) -> void:
	if dmg == 0:
		return
	
	# Internally update health
	curr_health = clampi(curr_health - dmg, 0, max_health)
	
	await health_bar.update_health(curr_health)


func _on_player_recover_hp(amount:float) -> void:
	if 0.0 < amount and amount < 1.0:
		# Increase by integer amount, not float
		curr_health = clampi(int(curr_health * (1.0 + amount)), curr_health, max_health)
		await health_bar.update_health(curr_health)


func _play(player:AudioStreamPlayer) -> void:
	if !player.playing:
		player.play()
