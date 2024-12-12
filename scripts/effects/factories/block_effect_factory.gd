class_name BlockEffectFactory
extends EffectFactory


func generate(target:Character, turns:int, amount:float) -> void:
	turns = max(2 * (turns - 1) + 1, 1)
	target.add_child(BlockEffect.new(turns))
