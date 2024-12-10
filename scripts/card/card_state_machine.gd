class_name CardStateMachine
extends Node

@onready var init_state:CardState = $EnabledState

var curr_card_state:CardState
var states := {}


enum State {
	ENABLED,
	SELECTED,
	DISABLED,
	EMPTY,
}

func setup(card:Card) -> void:
	if card.texture_normal == null:
		init_state = $EmptyState
	
	
	for child in get_children():
		if child is CardState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.card_ui = card
	
	if init_state:
		init_state.enter()
		curr_card_state = init_state

# TODO possibly delete this func later
# Connect state with the card and the transition
#func _connect_state(state:CardState, card:Card) -> void:
	#state.transition_requested.connect(_on_transition_requested)
	#state.card_ui = card


func on_gui_input(event:InputEvent) -> void:
	if curr_card_state:
		curr_card_state.on_gui_input(event)


func _on_transition_requested(from:CardState, to:CardState.State) -> void:
	#TODO print("transitioning to...  ", CardState.State.keys()[to])
	
	if from != curr_card_state:
		return

	var new_card_state:CardState = states[to]
	
	if not new_card_state:
		return
	
	if curr_card_state:
		curr_card_state.exit()
	
	curr_card_state = new_card_state
	curr_card_state.enter()
