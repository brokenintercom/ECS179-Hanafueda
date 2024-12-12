class_name BlockEffect
extends Effect


func _init(parent:Character, turns:int) -> void:
	super(parent, turns)
	
	_parent.atk_multiplier = 0.0
	if _parent is Player:
		signals.enemy_hit.connect(_remove_effect)
		signals.player_hit.connect(_apply_effect)
	else:
		signals.player_hit.connect(_remove_effect)
		signals.enemy_hit.connect(_apply_effect)


# Effect removed after enemy does damage
func _remove_effect(dmg:float) -> void:
	queue_free()


func _apply_effect(dmg:float) -> void:
	_parent.atk_multiplier = 0.0
