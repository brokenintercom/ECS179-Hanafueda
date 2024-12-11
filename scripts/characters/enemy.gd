class_name Enemy
extends Character

@export var base_atk:int
@onready var health_number = $HealthBarBG/HealthNumber

# TODO can access player as a global -- simplpy do "player"
func _ready() -> void:
	signals.enemy_hit.connect(_on_enemy_hit)
	signals.switch_scene.connect(_reset_hp)
	
	format_health(max_health, max_health)
	
	health_bar.init_health(max_health)
	print("enemy starting health ", max_health)
	
	super()


func format_health(health:int, max_health:int):
	var health_number_format = "%s/%s"
	var health_number_string = health_number_format % [str(health), str(max_health)]
	health_number.text = health_number_string
	print("enemy health number:", health_number_string)


func actions():
	signals.player_hit.emit(base_atk * atk_multiplier)
	# TODO Chris: enemy needs to randomly decide whether to do an effect or not
	# TODO if yes, then pick between debuffing attack, damage it takes next turn, shrink hand, etc.
	_finish_turn()


func _on_enemy_hit(dmg:int) -> void:
	# Internally update health
	print("Enemy health before: ", curr_health)
	curr_health = clampi(curr_health - dmg, 0, max_health)
	print("Enemy health after: ", curr_health)
	
	health_bar.update_health(curr_health)
	format_health(curr_health, max_health)
	
	await get_tree().create_timer(0.7).timeout


func _reset_hp(scene_name:String) -> void:
	if scene_name == "results_screen":
		format_health(max_health, max_health)
