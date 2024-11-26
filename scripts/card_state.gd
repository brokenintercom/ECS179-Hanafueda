class_name CardState
extends Node

enum State {
	ENABLED,
	SELECTED,
	DISABLED,
	EMPTY,
}

signal transition_requested(from:CardState, to:State)

@export var state:State

var card_ui:Card


func enter() -> void:
	pass


# Cleanup functionn, if needed
func exit() -> void:
	pass


func on_gui_input(_event:InputEvent) -> void:
	pass
