class_name Character
extends Node2D


@export var max_health:int
var curr_health:int


func _ready() -> void:
	curr_health = max_health
	print("curr_health is", curr_health)
	signals.character_hit.connect(_on_character_hit)


func _on_character_hit(target:Character, dmg:int) -> void:
	# Internally update health
	target.curr_health = clampi(target.curr_health - dmg, 0, target.max_health)
