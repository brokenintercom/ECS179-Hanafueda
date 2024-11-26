class_name CardStateMachine
extends Node

@export var init_state:CardState

var curr_card_state:CardState
var states := {}

func init(card:Card) -> void:
	for child in get_children():
		if child is CardState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.card_ui = card
	
	if init_state:
		init_state.enter()
		curr_card_state = init_state


func on_gui_input(event:InputEvent) -> void:
	if curr_card_state:
		curr_card_state.on_gui_input(event)


func _on_transition_requested(from:CardState, to:CardState.State) -> void:
	print("transitioning to...  ", CardState.State.keys()[to])
	
	if from != curr_card_state:
		return

	var new_card_state:CardState = states[to]
	
	if not new_card_state:
		return
	
	if curr_card_state:
		curr_card_state.exit()
	
	new_card_state.enter()
	curr_card_state = new_card_state
