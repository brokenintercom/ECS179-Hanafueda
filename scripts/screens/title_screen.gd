class_name TitleScreen
extends Node2D


func _ready() -> void:
	player.health_bar.visible = false
	enemy.health_bar.visible = false


func _process(_delta):
	pass


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
		
	if event.is_pressed():
		print("Switching to battle screen...")
		signals.switch_scene.emit("battle_screen")
	
