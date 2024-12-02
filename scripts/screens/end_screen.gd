class_name EndScreen
extends Node


@onready var message:Label = $Label

@export var lost_game:bool # TODO need to create a var lost_game (global or nah?)


func _ready() -> void:
	pass


func _process(_delta):
	pass


func _on_back_button_pressed() -> void:
	print("Switching to title screen...")
	signals.switch_scene.emit("title_screen")


func _on_quit_button_pressed() -> void:
	print("quitting...")
	get_tree().quit()


func game_over_text() -> void:
	if lost_game:
		message.text = "YOU LOSE!"
	
	if not lost_game:
		message.text = "YOU WIN!"
	
	
