# CREDITS: code based on [some youtube video input here i think?]
# TODO we need to add the link
class_name HealthBar
extends ProgressBar

var health:int
@onready var timer := $Timer
@onready var health_number = $"../HealthBarBG/HealthNumber"
@onready var dmg_bar = $DamageBar


func init_health(_health:int):
	health = _health
	max_value = health
	value = health
	dmg_bar.max_value = health
	dmg_bar.value = health
	
	_format_health()


func update_health(new_health:int):
	var prev_health = health
	
	health = clampi(new_health, 0, max_value)
	value = health
	_format_health()
	
	await get_tree().create_timer(0.3).timeout
	
	if health < prev_health:
		timer.start()
	else: 
		dmg_bar.value = health
	
	await get_tree().create_timer(1.5).timeout

func _on_timer_timeout() -> void:
	dmg_bar.value = health


func _format_health():
	var health_number_format = "%s/%s"
	var health_number_string = health_number_format % [str(health), str(max_value)]
	health_number.text = health_number_string
	print("character's health number:", health_number_string)
