class_name PlayerCards
extends Node

@export var max_hand_size := 8
var num_cards:int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	num_cards = max_hand_size
