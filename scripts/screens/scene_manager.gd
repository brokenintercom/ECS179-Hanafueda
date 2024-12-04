class_name SceneManager
extends Node2D


@onready var current_scene := $TitleScreen


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Hide the player's canvas layer when starting
	player.hand.visible = false
	player.health_bar.visible = false
	signals.switch_scene.connect(_on_switch_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_switch_scene(next_scene_name:String) -> void:
	if current_scene is BattleScreen:
		player.hand.visible = false
	
	var next_scene = load("res://scenes/" + next_scene_name + ".tscn").instantiate()
	add_child(next_scene)
	current_scene.queue_free()
	current_scene = next_scene
