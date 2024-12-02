extends ProgressBar

@onready var timer := $Timer
@onready var dmg_bar = $DamageBar

var health = 0 : set = _update_health

func _update_health(new_health):
	var prev_health = new_health
	health = min(max_value, new_health)
	value = health
	
	if health <= 0:
		queue_free()
	
	if health < prev_health:
		timer.start()
	else: 
		dmg_bar.value = health


func init_health(_health):
	health = _health
	max_value = health
	value = health
	dmg_bar.max_value = health
	dmg_bar.value = health

func _on_timer_timeout() -> void:
	dmg_bar.value = health