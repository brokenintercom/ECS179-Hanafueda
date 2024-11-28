class_name Enemy
extends Character


# TODO can access player as a global -- simplpy do "player"

func temp_func():
	signals.character_hit.emit(player, 10.0)
	signals.switch_battle_phase.emit()
