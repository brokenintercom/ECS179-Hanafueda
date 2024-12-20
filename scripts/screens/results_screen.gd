class_name ResultsScreen
extends Node

@onready var small_message:Label = $SmallMessage
@onready var big_message:Label = $BigMessage
@onready var win_screen = $WinScreen
@onready var loss_screen = $LossScreen

func _ready() -> void:
	win_screen.visible = false
	loss_screen.visible = false
	

func _process(_delta):
	if player.did_win:
		big_message.text = "YOU WIN!!"
		win_screen.visible = true
		_stop($Audio/Lose)
		_play($Audio/Win)
	else:
		big_message.text = "YOU LOST..."
		loss_screen.visible = true


func _on_back_button_pressed() -> void:
	_stop($Audio/Win)
	_stop($Audio/Lose)
	signals.switch_scene.emit("title_screen")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


#func _on_credits_button_pressed() -> void:
	#signals.switch_scene.emit("credits_screen")


func _play(player:AudioStreamPlayer) -> void:
	if !player.playing:
		player.play()


func _stop(player:AudioStreamPlayer) -> void:
	player.stop()
