class_name Character
extends Node2D

@export var max_health:int
@onready var health_bar = $HealthBar

var curr_health:int
var atk_multiplier := 1.0

var heal_eff:Effect
var atk_buff_eff:Effect
var block_eff:Effect

func _ready() -> void:
	curr_health = max_health

	print("curr health = ", curr_health)


# Cleanup at the end of the turn
func _finish_turn():
	# Reset atk multiplier (i.e., remove buffs/debuffs on it) and signal to switch scenes
	atk_multiplier = 1.0
	signals.switch_battle_phase.emit()


# Reset back to original
func reset() -> void:
	curr_health = max_health
	health_bar.update_health(curr_health)
	atk_multiplier = 1.0
	health_bar.visible = false
