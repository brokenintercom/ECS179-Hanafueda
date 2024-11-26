class_name SelectedState
extends CardState

var spec_version:CardSpec

func enter() -> void:
	card_ui.highlight.visible = true
	
	spec_version = CardSpecFactory.card_to_spec(card_ui)
	player.selected_cards.append(spec_version)
	
	player.hand.update_matches(player.selected_cards)
	
	print("--SELECTED CARD ATTRIBUTES--")
	print("Month: ", CardSpec.Month.keys()[spec_version.month])
	print("Type: ", spec_version.type)  # Using type directly here since we use custom values for type


func on_gui_input(event:InputEvent) -> void:
	if event.is_action_pressed("click"):
		var index:int = player.selected_cards.find(spec_version)
		
		if index == -1:
			return
		else:
			# Card was deselected, so erase from selected_cards array
			# and transition this card's state to ENABLED
			player.selected_cards.erase(spec_version)
			transition_requested.emit(self, CardState.State.ENABLED)


# The only way to go to the empty state is to be in the selected state
func transition_to_empty() -> void:
	transition_requested.emit(self, CardState.State.EMPTY)
