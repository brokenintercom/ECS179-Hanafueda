class_name ShrinkHandEffect
extends Effect

var _num_cards:int


func _init(parent:Character, turns:int, num_cards:int) -> void:
	super(parent, turns)
	_num_cards = num_cards


func _on_switch_battle_phase() -> void:
	super()
	
	assert(_parent is Player, "Error: Target is not Player")
	var player := _parent as Player
	if not player:
		return
	
	player.hand.max_hand_size = clampi(player.hand.max_hand_size, 0, player.hand.MAX_HAND)
