class_name Enemy
extends Character


# TODO signals.character_hit.emit(player, dmg)
# TODO can access player as a global -- simplpy do "player"

func temp_func():
	signals.switch_battle_phase.emit()
