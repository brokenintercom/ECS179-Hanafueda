class_name HealEffect
extends Effect


func apply(target:Character, amount:float) -> void:
	assert(target is Player, "Error: Target is not Player")
	
	var player := target as Player
	if not player:
		return
	
	signals.player_recover_hp.emit(amount)
