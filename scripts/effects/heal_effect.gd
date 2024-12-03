class_name HealEffect
extends Effect


func apply(target:Character, amount:float) -> void:
	signals.recover_hp.emit(target, amount)
