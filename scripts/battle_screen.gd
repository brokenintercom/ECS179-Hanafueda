class_name BattleScreen
extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_attack_button_pressed() -> void:
	print("Switching to title screen...")
	signals.switch_scene.emit("title_screen")
