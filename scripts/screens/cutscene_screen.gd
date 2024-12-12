extends CanvasLayer

@onready var continue_text = $Text/ContinueText
@onready var escape_text = $Text/EscapeText
@onready var timer = $Text/Timer

@export var slides:Array[Node]
var current_slide:int = 0
var last_slide:int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signals.next_page.connect(_next_page)

	# Set every slide to !visible at the beginning
	for slide in slides:
		if slide != null:
			slide.visible = false
	
	if (len(slides) > current_slide + 1):
		slides[current_slide].visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		signals.switch_scene.emit("battle_screen")


func _on_timer_timeout():
	print("go away text")
	continue_text.visible = !continue_text.visible
	escape_text.visible = !escape_text.visible


func _next_page() -> void:
	current_slide += 1
	if current_slide == last_slide:
		signals.switch_scene.emit("battle_screen")
	
	if len(slides) < current_slide + 1:
		pass
	
	for index in len(slides):
		if slides[index] != null:
			if index == current_slide:
				slides[current_slide].visible = true
			else:
				slides[index].visible = false
	
