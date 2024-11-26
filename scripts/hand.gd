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


func _update_category_match(selected_cards:Array[CardSpec]) -> void:
	var num_selected := len(selected_cards)
	
	# After selecting/deselecting, we have no cards selected now
	if num_selected == 0:
		category_match = Match.NONE
	elif num_selected == 1:
		category_match = Match.BOTH
	
	var running_month := CardSpec.Month.NONE
	var running_type := CardSpec.Type.NONE
	
	if category_match == Match.BOTH and num_selected > 1:
		running_month = selected_cards[0].month
		running_type = selected_cards[0].type
	
		if selected_cards[1].month != running_month:
			category_match = Match.TYPE
		elif selected_cards[1].type != running_type:
			category_match = Match.MONTH
	
	print("Category match is: ", category_match)


func update_matches(selected_cards:Array[CardSpec]) -> void:
	_update_category_match(selected_cards)
	
	var card_nodes := get_node("GridContainer").get_children()
	
	for card in card_nodes:
		# Only look at non-selected cards
		if card.is_selected():
			continue
		
		# Update the card's state
		var curr_card_state:CardState = card.state_machine.curr_card_state
		
		if (
			(category_match == Match.NONE or card.does_match(category_match))
			and curr_card_state.state == CardState.State.DISABLED
		):
			# Matches the category -- transition to ENABLED state
			curr_card_state.exit()
		elif curr_card_state.state == CardState.State.ENABLED:
			# Doesn't match the category -- transition to DISABLED state
			curr_card_state.exit()
