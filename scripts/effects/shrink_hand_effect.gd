class_name ShrinkHandEffect
extends Effect


var _num_cards:int


func _init(turns:int, num_cards:int) -> void:
	super(turns)
	_num_cards = num_cards


func _on_switch_battle_phase() -> void:
	super()
	
	var parent := get_parent() as Character
	assert(parent is Player, "Error: Target is not Player")
	var player := parent as Player
	if not player:
		return
	
	player.hand.max_hand_size = clampi(player.hand.max_hand_size, 0, player.hand.MAX_HAND)


# Reduce player hand size by amount
func apply(target:Character, amount:float) -> void:
	
	
	var player := target as Player
	
	if not player:
		return
	
	# TODO can use clampi
	player.hand.max_hand_size -= max(floor(amount), 0)
	player.hand.max_hand_size = max(player.hand.max_hand_size, 0)
