extends CanvasLayer

@onready var _color_rect = $ColorRect
@onready var _animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_color_rect.visible = false
	_animation_player.animation_finished.connect(_on_animation_finished)


func transition():
	_color_rect.visible = true
	_animation_player.play("fade_to_black")


func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		signals.on_transition_finished.emit()
		_animation_player.play("fade_from_black")
	elif anim_name == "fade_from_black":
		_color_rect.visible = false
