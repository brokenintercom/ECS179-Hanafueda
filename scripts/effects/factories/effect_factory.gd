class_name EffectFactory


# Overwritten by children
func generate(target:Character, turns:int, amount:float) -> void:
	turns = max(2 * turns, 0)
	target.add_child(Effect.new(turns))
