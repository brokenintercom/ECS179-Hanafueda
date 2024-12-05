class_name Enemy
extends Character

@export var base_atk:int


# TODO can access player as a global -- simplpy do "player"
func _ready() -> void:
	super()
	signals.enemy_hit.connect(_on_enemy_hit)
	
	# reset enemy healthbar color to red
	var sb = StyleBoxFlat.new()
	health_bar.add_theme_stylebox_override("fill", sb)
	sb.bg_color = Color("f44355")
	
	health_bar.init_health(max_health)
	print("enemy starting health ", max_health)


func enemy_actions():
	signals.player_hit.emit(base_atk * atk_multiplier)
	# TODO Chris: enemy needs to randomly decide whether to do an effect or not
	# TODO if yes, then pick between debuffing attack, damage it takes next turn, shrink hand, etc.
	_finish_turn()


func _on_enemy_hit(dmg:int) -> void:
	# Internally update health
	print("Enemy health before: ", curr_health)
	curr_health = clampi(curr_health - dmg, 0, max_health)
	health_bar.update_health(curr_health)
	print("Enemy health after: ", curr_health)
