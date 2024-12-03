extends Node2D


@onready var endscreen:CanvasLayer = $EndScreen


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	endscreen.set_message("YOU WON")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
