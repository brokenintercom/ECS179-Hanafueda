extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)


func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")


func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		signals.on_transition_finished.emit()
		animation_player.play("fade_from_black")
	elif anim_name == "fade_from_black":
		color_rect.visible = false
