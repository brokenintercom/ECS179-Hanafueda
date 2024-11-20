class_name Enemy
extends Character

@export var num_turns_left:int
@onready var _player := $"../Player"


# TODO signals.character_hit.emit(_player, dmg)
