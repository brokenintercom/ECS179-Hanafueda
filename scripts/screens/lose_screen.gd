extends Node2D

@onready var endscreen:CanvasLayer = $EndScreen



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass # Replace with function body.
	endscreen.set_message("YOU LOST")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
