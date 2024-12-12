class_name HealEffect
extends Effect


var _heal_amt:float


func _init(turns:int, amount:float) -> void:
	super(turns)
	_heal_amt = amount


func _on_switch_battle_phase() -> void:
	if _turns % 2 == 0:
		signals.player_recover_hp.emit(_heal_amt)
	
	super()
