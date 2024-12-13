class_name Hand
extends CanvasLayer

enum Match {
	MONTH,
	TYPE,
	NONE,
	BOTH,
}

const MAX_HAND := 8

var max_hand_size := MAX_HAND
var num_cards := 0
var category_match:Match
var running_month := CardSpec.Month.NONE
var running_type := CardSpec.Type.NONE
var _match_label:Label


func _ready() -> void:
	signals.battle_scene_loaded.connect(_on_battle_scene_loaded)


func is_empty() -> bool:
	return num_cards == 0


func update_matches(selected_cards:Array[CardSpec]) -> void:
	_update_category_match(selected_cards)
	
	var card_nodes := get_node("GridContainer").get_children()
	
	# calc preview dmg and edit helathbar
	var potential_dmg = DamageEngine.calc_dmg(selected_cards, category_match, player.atk_multiplier)
	enemy.health_bar.preview_health(potential_dmg)
	
	for card in card_nodes:
		# Only look at non-selected cardsvar dmg = DamageEngine.calc_dmg(selected_cards, hand.category_match, atk_multiplier)
		if card.is_selected():
			continue # add dmg calc here
		
		# Update the card's state
		var curr_card_state:CardState = card.get_curr_card_state()
		
		if _does_match(card):
			# Matches the category -- transition to ENABLED state as needed
			if curr_card_state.state == CardState.State.DISABLED:
				curr_card_state.transition_to_enabled()
		elif curr_card_state.state == CardState.State.ENABLED:
			# Doesn't match the category -- transition to DISABLED state
			curr_card_state.transition_to_disabled()


func _update_category_match(selected_cards:Array[CardSpec]) -> void:
	var num_selected := len(selected_cards)
	
	# After selecting/deselecting, we have no cards selected now
	if num_selected == 0:
		category_match = Match.NONE
		_match_label.text = "Matching By: None"
		return
	elif num_selected == 1:
		category_match = Match.BOTH
		_match_label.text = "Matching By: Type"
	
	running_month = selected_cards[0].month
	running_type = selected_cards[0].type
	
	# Reset to Match.BOTH until we find something more specific
	category_match = Match.BOTH
	_match_label.text = "Matching By: Type"
	
	if num_selected > 1:
		for index in range(1, num_selected):
			# Prioritize matching by type over matching by month
			var type_match = selected_cards[index].type == running_type
			var month_match = selected_cards[index].month == running_month
			
			# TODO code style...probably a way to condense this
			if category_match == Match.BOTH and type_match and month_match:
				continue  # Keep the category_match as Match.BOTH
			elif type_match:
				_match_label.text = "Matching By: Type"
				category_match = Match.TYPE
				break
			elif month_match:
				_match_label.text = "Matching By: Month"
				category_match = Match.MONTH
				break


func _does_match(card:Card) -> bool:
	if category_match == Match.NONE:
		# category_match == Match.NONE, so no cards have been selected yet -- no cards to match with yet!
		return true
	
	var does_match := false
	
	if category_match == Match.BOTH or category_match == Match.MONTH:
		does_match = card.matches_month(running_month)
	
	if not does_match and (category_match == Match.BOTH or category_match == Match.TYPE):
		does_match = card.matches_type(running_type)
	
	return does_match


func _on_battle_scene_loaded(match_label:Label, _synergy_ui:Node2D, _enemy_anim_player:AnimationPlayer) -> void:
	_match_label = match_label
