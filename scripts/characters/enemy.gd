class_name Enemy
extends Character

@export var base_atk:int


func _ready() -> void:
	super()
	signals.enemy_hit.connect(_on_enemy_hit)
	
	# TODO
	# reset enemy healthbar color to red
	#var sb = StyleBoxFlat.new()
	#health_bar.add_theme_stylebox_override("fill", sb)
	#sb.bg_color = Color("f44355")
	
	health_bar.init_health(max_health)


func actions():
	var dmg_taken := max_health - curr_health
	var random_factor := randf_range(0.1, 0.3)
	var damage:int = max(3, int(dmg_taken * random_factor))
	
	signals.player_hit.emit(damage * atk_multiplier)
	
	# TODO Chris: enemy needs to randomly decide whether to do an effect or not
	# TODO if yes, then pick between debuffing attack, damage it takes next turn, shrink hand, etc.
	_finish_turn()


func _finish_turn() -> void:
	super()


func _on_enemy_hit(dmg:int) -> void:
	# Internally update health
	print("Enemy health before: ", curr_health)
	curr_health = clampi(curr_health - dmg, 0, max_health)
	print("Enemy health after: ", curr_health)
	
	await health_bar.update_health(curr_health)
