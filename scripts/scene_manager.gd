class_name SceneManager
extends Node2D


@onready var current_scene := $TitleScreen


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("hi")
	signals.switch_scene.connect(_on_switch_scene)
	print(signals.switch_scene.get_connections())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_switch_scene(next_scene_name:String) -> void:
	print("hi")
	var next_scene = load("res://scenes/" + next_scene_name + ".tscn").instantiate()
	add_child(next_scene)
	current_scene.queue_free()
	current_scene = next_scene
	
