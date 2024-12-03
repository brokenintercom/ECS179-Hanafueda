class_name BlockEffect
extends Effect


func apply(target:Character, amount:float) -> void:
	target.block_amount = max(floor(amount), 0)
