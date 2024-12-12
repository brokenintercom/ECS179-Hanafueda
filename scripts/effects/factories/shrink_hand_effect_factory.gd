class_name ShrinkHandEffectFactory
extends EffectFactory


func generate(target:Character, turns:int, amount:float) -> void:
	var num_cards:int = max(round(amount), 0)
	turns = max(2 * (turns - 1) + 1, 1)
	target.add_child(ShrinkHandEffect.new(turns, num_cards))
