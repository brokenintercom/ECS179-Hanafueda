class_name Character
extends Node2D

@export var max_health:int

var curr_health:int
var atk_multiplier := 1.0

var heal_eff:Effect
var atk_buff_eff:Effect
var block_eff:Effect

func _ready() -> void:
	curr_health = max_health

	print("curr health = ", curr_health)


func _cleanup():
	# Reset atk multiplier (i.e., remove buffs/debuffs on it) and signal to switch scenes
	atk_multiplier = 1.0
	signals.switch_battle_phase.emit()
