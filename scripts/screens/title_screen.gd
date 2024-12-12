class_name TitleScreen
extends Node2D


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("play"):
		signals.switch_scene.emit("battle_screen")


func _on_button_pressed() -> void:
	signals.switch_scene.emit("credits_screen")
