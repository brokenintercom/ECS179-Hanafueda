class_name Enemy
extends Character


# TODO can access player as a global -- simplpy do "player"
func _ready() -> void:
	super()
	signals.enemy_hit.connect(_on_enemy_hit)


func temp_func():
	signals.player_hit.emit(10.0)
	signals.switch_battle_phase.emit()


func _on_enemy_hit(dmg:int) -> void:
	# Internally update health
	print("Enemy health before: ", curr_health)
	curr_health = clampi(curr_health - dmg, 0, max_health)
	print("Enemy health after: ", curr_health)
