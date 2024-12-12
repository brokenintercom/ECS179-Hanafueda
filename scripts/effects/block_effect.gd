class_name BlockEffect
extends Effect


func _init(turns:int) -> void:
	super(turns)
	signals.player_hit.connect(_on_player_hit)


# Effect removed after enemy does damage
func _on_player_hit() -> void:
	queue_free()


func _on_switch_battle_phase() -> void:
	super()

	var parent := get_parent() as Character
	parent.atk_multiplier = 0.0
