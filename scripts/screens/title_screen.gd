class_name TitleScreen
extends Node2D


func _ready() -> void:
	player.health_bar.visible = false
	enemy.health_bar.visible = false


func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		print("Switching to battle screen...")
		signals.switch_scene.emit("battle_screen")

func _switch_to_battle(event):
	if Input.is_action_just_pressed("ui_select"):
		print("Switching to battle screen...")
		signals.switch_scene.emit("battle_screen")
