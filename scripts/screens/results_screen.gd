class_name EndScreen
extends Node

@onready var small_message:Label = $SmallMessage
@onready var big_message:Label = $BigMessage


func _ready() -> void:
	pass


func _process(_delta):
	if player.did_win:
		big_message.text = "WAHOO!!!"
		small_message.text = "You won!"
	else:
		big_message.text = "GAME OVER..."
		small_message.text = "You lost :("
		
	


func _on_back_button_pressed() -> void:
	signals.switch_scene.emit("title_screen")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
