class_name AttackBuffEffectFactory
extends EffectFactory


func generate(target:Character, turns:int, amount:float) -> void:
	turns = max(turns, 0)
	amount = max(amount, 1.0)
	target.add_child(AttackBuffEffect.new(target, turns, amount))
