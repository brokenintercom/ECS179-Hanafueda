class_name BlockEffect
extends Effect


func apply(target:Character, amount:float) -> void:
	target.atk_multiplier = amount
