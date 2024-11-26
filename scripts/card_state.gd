class_name CardState
extends Node

enum State {BASE, SELECTED}

signal transition_requested(from:CardState, to:State)

@export var state:State

var card_ui:Card

func enter() -> void:
	pass

func exit() -> void:
	pass
	
func on_gui_input(_event:InputEvent) -> void:
	pass
