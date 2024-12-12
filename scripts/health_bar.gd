# CREDITS: following code is based off of DashNothing's tutorial video
# link:https://youtu.be/f90ieBOoIYQ

class_name HealthBar
extends ProgressBar

var health:int
var cur_health:int # placeholder 
@onready var timer := $Timer
@onready var health_number = $"../HealthBarBG/HealthNumber"
@onready var dmg_bar = $DamageBar


func init_health(_health:int):
	health = _health
	cur_health = health
	max_value = health
	value = health
	dmg_bar.max_value = health
	dmg_bar.value = health
	
	_format_health(health)


func update_health(new_health:int):
	# reset from preview health dmg
	health = cur_health
	value = health
	var prev_health := health
	
	health = clampi(new_health, 0, max_value)
	cur_health = health # update cur health so that it matches health
	value = health
	_format_health(health)
	
	if health < prev_health:
		timer.start()
	else: 
		dmg_bar.value = health


func preview_health(dmg:int):
	value = cur_health # make sure preview starts w cur health
	
	health = cur_health - dmg # preview health calc dmg
	value = health # show preview health
	_format_health(health)


func _on_timer_timeout() -> void:
	print("timeout: updating health bar...")
	dmg_bar.value = health


func _format_health(health:int):
	var health_number_format = "%s/%s"
	var health_number_string = health_number_format % [str(health), str(max_value)]
	health_number.text = health_number_string
