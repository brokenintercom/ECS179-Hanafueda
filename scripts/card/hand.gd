class_name Hand
extends CanvasLayer

enum Match {
	MONTH,
	TYPE,
	NONE,
	BOTH,
}

@export var max_hand_size := 8
var num_cards := 0
var category_match:Match  
var running_month := CardSpec.Month.NONE
var running_type := CardSpec.Type.NONE


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
		
	
	print("--> Final chosen category match is: ", Match.keys()[category_match])
	
	if category_match == Match.MONTH:
		print("--> Month: ", CardSpec.Month.keys()[selected_cards[0].month])
	elif category_match == Match.TYPE:
		print("--> Type: ", CardSpec.Type.keys()[selected_cards[0].type])


func update_matches(selected_cards:Array[CardSpec]) -> void:
	_update_category_match(selected_cards)
	
	var card_nodes := get_node("GridContainer").get_children()
	
	print("--------UPDATING MATCHES--------")
	print("Category match: ", Match.keys()[category_match])
	
	for card in card_nodes:
		# Only look at non-selected cards
		if card.is_selected():
			continue
		
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


func _does_match(card:Card) -> bool:
	# TODO code style
	if category_match == Hand.Match.BOTH or category_match == Hand.Match.MONTH:
		return card.matches_month(running_month)
	elif category_match == Hand.Match.BOTH or category_match == Hand.Match.TYPE:
		return card.matches_type(running_type)
	
	# category_match == Hand.Match.NONE, so no cards have been selected yet -- no cards to match with yet!
	return true
