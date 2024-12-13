class_name TitleScreen
extends Node2D


func _on_start_button_pressed() -> void:
	signals.switch_scene.emit("battle_screen")


func _on_credits_button_pressed() -> void:
	signals.switch_scene.emit("credits_screen")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	

# TODO: add a difficulty slide? 
# Difficultly < EASY > < HARD >
