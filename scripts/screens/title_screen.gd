class_name TitleScreen
extends Node2D


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
		
	if event.is_pressed():
		signals.switch_scene.emit("battle_screen")
	
