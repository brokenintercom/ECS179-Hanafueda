class_name EffectFactory


# Overwritten by children
func generate(target:Character, turns:int, amount:float) -> void:
	turns = max(turns, 0)
	target.add_child(Effect.new(target, turns))
