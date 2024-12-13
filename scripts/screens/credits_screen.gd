extends Node

func _on_back_pressed() -> void:
	signals.switch_scene.emit("title_screen")
