class_name Enemy
extends Character

@export var base_atk:int
@onready var health_number = $HealthBarBG/HealthNumber

# TODO can access player as a global -- simplpy do "player"
func _ready() -> void:
	signals.enemy_hit.connect(_on_enemy_hit)
	
	format_health(max_health, max_health)
	
	health_bar.init_health(max_health)
	
	super()


func format_health(health:int, max_health:int):
	var health_number_format = "%s/%s"
	var health_number_string = health_number_format % [str(health), str(max_health)]
	health_number.text = health_number_string
	print("enemy health number:", health_number_string)


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
	
	health_bar.update_health(curr_health)
	format_health(curr_health, max_health)
	
	await get_tree().create_timer(0.7).timeout
