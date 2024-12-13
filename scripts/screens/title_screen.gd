class_name TitleScreen
extends Node2D

@onready var mode:Label = $Difficulty

var difficulty = 0
var max_modes = 1 # if we wanna add more modes in the future, change this value

func _ready() -> void:
	if difficulty == 0:
		$LeftArrow.disabled = true
	
	if difficulty == max_modes: 
		$RightArrow.disabled = true


func _on_start_button_pressed() -> void:
	signals.switch_scene.emit("battle_screen")


func _on_credits_button_pressed() -> void:
	signals.switch_scene.emit("credits_screen")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _set_difficulty() -> void:
	if difficulty == 0:
		mode.text = "NORMAL"
		enemy.normal_difficulty = true
	if difficulty == 1:
		mode.text = "HARD"
		enemy.normal_difficulty = false

func _on_left_arrow_pressed() -> void:
	$RightArrow.disabled = false
	if difficulty >= 0:
		difficulty -= 1
		_set_difficulty()
	if difficulty == 0:
		$LeftArrow.disabled = true


func _on_right_arrow_pressed() -> void:
	$LeftArrow.disabled = false
	if difficulty <= max_modes: 
		difficulty += 1
		_set_difficulty()
	if difficulty == max_modes:
		$RightArrow.disabled = true
