class_name HealEffect
extends Effect

var _heal_amt:float


func _init(parent:Character, turns:int, amount:float) -> void:
	super(parent, turns)
	_heal_amt = amount
	
	if parent is Player:
		signals.player_recover_hp.emit(_heal_amt)
		signals.enemy_hit.connect(_on_enemy_hit)
	else:
		signals.enemy_recover_hp.emit(_heal_amt)
		signals.player_hit.connect(_on_player_hit)


func _on_enemy_hit(dmg:float) -> void:
	signals.player_recover_hp.emit(_heal_amt)


func _on_player_hit(dmg:float) -> void:
	signals.enemy_recover_hp.emit(_heal_amt)
