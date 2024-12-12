class_name ShrinkHandEffect
extends Effect

var _num_cards:int


func _init(parent:Character, turns:int, num_cards:int) -> void:
	super(parent, turns)
	_num_cards = num_cards
	player.hand.max_hand_size = clampi(player.hand.max_hand_size - _num_cards, 0, player.hand.MAX_HAND)


func _on_switch_battle_phase() -> void:
	_turns -= 1
	if _turns < 0:
		player.hand.max_hand_size += _num_cards
		queue_free()
