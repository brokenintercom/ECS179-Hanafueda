class_name HealEffectFactory
extends EffectFactory


func generate(target:Character, turns:int, amount:float) -> void:
	turns = max(turns, 0)
	amount = clamp(amount, 0.0, 1.0)
	target.add_child(HealEffect.new(target, turns, amount))
