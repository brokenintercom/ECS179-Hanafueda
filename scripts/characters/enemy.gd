class_name Enemy
extends Character


@onready var healthbar = $HealthBar


# TODO can access player as a global -- simplpy do "player"
func _ready() -> void:
	super()
	signals.enemy_hit.connect(_on_enemy_hit)
	
	# reset enemy healthbar color to red
	var sb = StyleBoxFlat.new()
	healthbar.add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("f44355")
	
	healthbar.init_health(max_health)
	print("enemy starting health ", max_health)


func temp_func():
	signals.player_hit.emit(10.0)
	signals.switch_battle_phase.emit()


func _on_enemy_hit(dmg:int) -> void:
	# Internally update health
	print("Enemy health before: ", curr_health)
	curr_health = clampi(curr_health - dmg, 0, max_health)
	healthbar.update_health(curr_health)
	print("Enemy health after: ", curr_health)
