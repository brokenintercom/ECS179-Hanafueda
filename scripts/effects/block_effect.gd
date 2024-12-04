class_name BlockEffect
extends Effect


func apply(target:Character, amount:float) -> void:
	print("Nullifying...")
	target.atk_multiplier = 0.0
