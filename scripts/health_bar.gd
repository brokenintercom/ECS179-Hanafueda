# CREDITS: code based on [some youtube video input here i think?]
# TODO we need to add the link
class_name HealthBar
extends ProgressBar

var health:int
@onready var timer := $Timer
@onready var dmg_bar = $DamageBar


func init_health(_health):
	health = _health
	max_value = health
	value = health
	dmg_bar.max_value = health
	dmg_bar.value = health


func update_health(new_health):
	var prev_health = health
	
	health = clampi(new_health, 0, max_value)
	value = health
	
	await get_tree().create_timer(0.3).timeout
	
	if health < prev_health:
		timer.start()
	else: 
		dmg_bar.value = health
	
	await get_tree().create_timer(0.3).timeout


func _on_timer_timeout() -> void:
	dmg_bar.value = health
