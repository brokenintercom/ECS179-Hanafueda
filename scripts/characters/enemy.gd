class_name Enemy
extends Character


# TODO can access player as a global -- simplpy do "player"

@onready var healthbar := $HealthBar

func _ready() -> void:
	#healthbar.set_color("StyleBoxFlat", "fill", Color(244, 67, 85, 255))
	var sb = StyleBoxFlat.new()
	healthbar.add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("f44355")

func temp_func():
	signals.character_hit.emit(player, 10.0)
	signals.switch_battle_phase.emit()
