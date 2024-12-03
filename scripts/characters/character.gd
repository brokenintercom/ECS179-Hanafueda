class_name Character
extends Node2D

@export var max_health:int
var curr_health:int
var atk_multiplier := 1.0


func _ready() -> void:
	curr_health = max_health
	


func _cleanup():
	# Reset atk multiplier and signal to switch scenes
	atk_multiplier = 1.0
	signals.switch_battle_phase.emit()
