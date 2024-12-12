extends Node

func _on_button_pressed() -> void:
	signals.switch_scene.emit("title_screen")
