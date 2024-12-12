class_name Effect
extends Node2D

var _turns:int
var _parent:Character


func _init(parent:Character, turns:int) -> void:
	_turns = turns
	_parent = parent
	signals.switch_battle_phase.connect(_on_switch_battle_phase)


func _on_switch_battle_phase() -> void:
	_turns -= 1
	if _turns < 0:
		queue_free()
