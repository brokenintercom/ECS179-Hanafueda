class_name ShrinkHandEffect
extends Effect


# Reduce player hand size by amount
func apply(target:Character, amount:float) -> void:
	assert(target is Player, "Error: Target is not Player")
	
	var player := target as Player
	
	if not player:
		return
	
	# TODO can use clampi
	player.hand.max_hand_size -= max(floor(amount), 0)
	player.hand.max_hand_size = max(player.hand.max_hand_size, 0)
