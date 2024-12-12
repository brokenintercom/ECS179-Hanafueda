# CREDITS: following code is based off of GodotGameLab's Tutorial
# link: https://youtu.be/Pa0P1lUoC-M

class_name CardStateMachine
extends Node

enum State {
	ENABLED,
	SELECTED,
	DISABLED,
	EMPTY,
}

var curr_card_state:CardState
var _states := {}
@onready var init_state:CardState = $EnabledState


func setup(card:Card) -> void:
	if card.texture_normal == null:
		init_state = $EmptyState
	
	for child in get_children():
		if child is CardState:
			_states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.card_ui = card
	
	if init_state:
		init_state.enter()
		curr_card_state = init_state


func on_gui_input(event:InputEvent) -> void:
	if curr_card_state:
		curr_card_state.on_gui_input(event)


func _on_transition_requested(from:CardState, to:CardState.State) -> void:
	if from != curr_card_state:
		return

	var new_card_state:CardState = _states[to]
	
	if not new_card_state:
		return
	
	if curr_card_state:
		curr_card_state.exit()
	
	curr_card_state = new_card_state
	curr_card_state.enter()
