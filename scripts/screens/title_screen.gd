class_name TitleScreen
extends Node2D


func _ready() -> void:
	player.health_bar.visible = false
	enemy.health_bar.visible = false


func _process(_delta):
	pass


func _on_start_button_pressed() -> void:
	print("Switching to battle screen...")
	signals.switch_scene.emit("battle_screen")
