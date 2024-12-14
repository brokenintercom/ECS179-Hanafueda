class_name SceneManager
extends Node2D

@onready var current_scene := $TitleScreen
@onready var bgm := $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Hide the player's canvas layer when starting
	player.hand.visible = false
	player.health_bar.visible = false
	
	deck_view.visible = false
	signals.switch_scene.connect(_on_switch_scene)
	signals.switch_scene.emit("title_screen")

func _on_switch_scene(next_scene_name:String) -> void:
	if current_scene is BattleScreen:
		player.hand.visible = false
	
	var next_scene = load("res://scenes/" + next_scene_name + ".tscn").instantiate()
	add_child(next_scene)
	current_scene.queue_free()
	current_scene = next_scene
	
	# Title audio handler
	if next_scene_name == "title_screen" or next_scene_name == "credits_screen":
		_play_audio()
	else:
		bgm.stop()


func _play_audio() -> void:
	if bgm.playing:
		return
	
	bgm.play()
