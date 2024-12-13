class_name AttackBuffEffect
extends Effect

var _atk_buff:float


func _init(parent:Character, turns:int, buff:float) -> void:
	super(parent, turns)
	_atk_buff = buff


func _on_switch_battle_phase() -> void:
	super()
	
	_parent.atk_multiplier = _atk_buff
