class_name Enemy
extends Character

@export var base_atk:int


func _ready() -> void:
	signals.enemy_hit.connect(_on_enemy_hit)
	health_bar.init_health(max_health)
	
	super()


func actions():
	print("Enemy actions: waiting 1.0 sec before starting...")
	await get_tree().create_timer(1.0).timeout
	var dmg_taken := max_health - curr_health
	var random_factor := randf_range(0.1, 0.3)
	var damage:int = max(3, int(dmg_taken * random_factor))
	
	signals.player_hit.emit(damage * atk_multiplier)
	print("Enemy just emitted player_hit, now waiting 1.0 sec")
	await get_tree().create_timer(1.0).timeout
	
	# TODO Chris: enemy needs to randomly decide whether to do an effect or not
	# TODO if yes, then pick between debuffing attack, damage it takes next turn, shrink hand, etc.
	# TODO modify the "effect_text" attribute (in character.gd) or player.effect_text
	# TODO depending on whether the effect is on the enemy itself (buff) or on the player (debuff)
	_finish_turn()


func _finish_turn() -> void:
	super()


func _on_enemy_hit(dmg:int) -> void:
	# Internally update health
	curr_health = clampi(curr_health - dmg, 0, max_health)
	print("about to await enemy health update")
	await health_bar.update_health(curr_health)
