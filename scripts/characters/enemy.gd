class_name Enemy
extends Character


# TODO can access player as a global -- simplpy do "player"

@onready var healthbar = $HealthBar

func _ready() -> void:
	# reset enemy healthbar color to red
	var sb = StyleBoxFlat.new()
	healthbar.add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("f44355")
	
	healthbar.init_health(max_health)
	print("enemy starting health ", max_health)

func temp_func():
	signals.character_hit.emit(player, 10.0)
	signals.switch_battle_phase.emit()
