class_name AttackBuffEffect
extends Effect

var _atk_buff:float


func _init(turns:int, buff:float) -> void:
	super(turns)
	_atk_buff = buff


func _on_switch_battle_phase() -> void:
	super()
	
	var parent := get_parent() as Character
	parent.atk_multiplier = _atk_buff
