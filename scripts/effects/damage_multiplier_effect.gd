class_name DamageMultiplierEffect
extends Effect


func apply(target:Character, amount:float) -> void:
	target.atk_multiplier = max(amount, 0.0)
