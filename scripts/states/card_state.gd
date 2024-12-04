class_name CardState
extends Node

enum State {
	ENABLED,
	SELECTED,
	DISABLED,
	EMPTY,
}

signal transition_requested(from:CardState, to:State)

var state:State
var card_ui:Card


func enter() -> void:
	pass


# Cleanup functionn, if needed
func exit() -> void:
	pass


func on_gui_input(_event:InputEvent) -> void:
	pass


func transition_to_empty() -> void:
	transition_requested.emit(self, CardState.State.EMPTY)
