class_name BlockEffectFactory
extends EffectFactory


func generate(target:Character, turns:int, amount:float) -> void:
	turns = max(turns, 0)
	target.add_child(BlockEffect.new(target, turns))
