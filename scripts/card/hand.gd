class_name Hand
extends CanvasLayer

enum Match {
	MONTH,
	TYPE,
	NONE,
	BOTH,
}

var max_hand_size := 8
var num_cards := 0
var category_match:Match  
var running_month := CardSpec.Month.NONE
var running_type := CardSpec.Type.NONE


func is_empty() -> bool:
	return num_cards == 0


func update_matches(selected_cards:Array[CardSpec]) -> void:
	_update_category_match(selected_cards)
	
	var card_nodes := get_node("GridContainer").get_children()
	
	# TODO print("--------UPDATING MATCHES--------")
	# TODO print("Category match: ", Match.keys()[category_match])
	
	# TODO if possible, combine the code here...so that you don't have to do the if statement again
	# calc preview dmg and edit helathbar
	var atk_mult = 1.0
	if player.ino_shika_cho_active:
		atk_mult = 2.0
	var potential_dmg = DamageEngine.calc_dmg(selected_cards, category_match, atk_mult)
	enemy.health_bar.preview_health(potential_dmg)
	
	for card in card_nodes:
		# Only look at non-selected cardsvar dmg = DamageEngine.calc_dmg(selected_cards, hand.category_match, atk_multiplier)
		if card.is_selected():
			continue # add dmg calc here
		
		# TODO delete
		#print("--CARD ATTRIBUTES--")
		#print("Month: ", CardSpec.Month.keys()[card.month])
		#print("Type: ", card.type)  # Using type directly here since we use custom values for type
		#print("Synergy: ", CardSpec.Synergy.keys()[card.synergy])
		
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
	# TODO may have to update so that we start over from the beginning every time to account for edge cases
	var num_selected := len(selected_cards)
	
	# After selecting/deselecting, we have no cards selected now
	if num_selected == 0:
		category_match = Match.NONE
		return
	elif num_selected == 1:
		category_match = Match.BOTH
	
	running_month = selected_cards[0].month
	running_type = selected_cards[0].type
	
	# Reset to Match.BOTH until we find something more specific
	category_match = Match.BOTH
	
	if num_selected > 1:
		for index in range(1, num_selected):
			# Prioritize matching by type over matching by month
			# TODO Cards have a matches_type() and matches_month(), but CardSpecs don't
			var type_match = selected_cards[index].type == running_type
			var month_match = selected_cards[index].month == running_month
			
			# TODO code style...probably a way to condense this
			if category_match == Match.BOTH and type_match and month_match:
				continue  # Keep the category_match as Match.BOTH
			elif type_match:
				category_match = Match.TYPE
				break
			elif month_match:
				category_match = Match.MONTH
				break
	
	#TODO
	#print("--> Final chosen category match is: ", Match.keys()[category_match])
	#
	#if category_match == Match.BOTH or category_match == Match.MONTH:
		#print("--> Month: ", CardSpec.Month.keys()[selected_cards[0].month])
	#if category_match == Match.BOTH or category_match == Match.TYPE:
		#print("--> Type: ", selected_cards[0].type)


func _does_match(card:Card) -> bool:
	if category_match == Match.NONE:
		# category_match == Match.NONE, so no cards have been selected yet -- no cards to match with yet!
		return true
	
	# TODO code style
	var does_match := false
	
	if category_match == Match.BOTH or category_match == Match.MONTH:
		does_match = card.matches_month(running_month)
	
	if not does_match and (category_match == Match.BOTH or category_match == Match.TYPE):
		does_match = card.matches_type(running_type)
	
	return does_match
