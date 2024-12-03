class_name Character
extends Node2D

@export var max_health:int

var curr_health:int
var atk_multiplier := 1.0


func _ready() -> void:
	curr_health = max_health

	print("curr health = ", curr_health)
	signals.character_hit.connect(_on_character_hit)
	signals.recover_hp.connect(_on_recover_hp)



func _cleanup():
	# Reset atk multiplier and signal to switch scenes
	atk_multiplier = 1.0
	signals.switch_battle_phase.emit()


func _on_character_hit(target:Character, dmg:int) -> void:
	# Internally update health
	print("current health = ", target.curr_health)
	#target.curr_health = clampi(target.curr_health - dmg, 0, target.max_health)
	target.curr_health = target.curr_health - 10
	target.healthbar.update_health(target.curr_health)
	#print(target, " health is now ", target.curr_health)
	print("dmg done = ", dmg)
	print("current health = ", target.curr_health)
	#target.healthbar.health = target.curr_health


func _on_recover_hp(target:Character, amount:float) -> void:
	if 0.0 < amount and amount < 1.0:
		# Increase by integer amount, not float
		target.curr_health = clampi(target.current_health * (1.0 + amount), curr_health, target.max_health)
		#target.healthbar.health = target.curr_health
