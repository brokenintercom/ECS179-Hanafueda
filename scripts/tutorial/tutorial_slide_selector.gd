extends CanvasLayer
## Based off of Exercise 2's camera controller

@export var slides:Array[Node]

var current_slide:int = 0

func _ready():
	
	signals.next_page.connect(_on_next_page)
	
	for slide in slides:
		if null!= slide:
			slide.visible = false
	if(len(slides) > current_slide + 1):
		slides[current_slide].visible = true
				
func _on_next_page() -> void:
	current_slide += 1
	if len(slides) < current_slide + 1:
		pass
		# TODO: Once the player reaches the end of the tutorial, close the tutorial
		
	for index in len(slides):
		if null != slides[index]:
			if index == current_slide:
				slides[current_slide].visible = true
			else:
				slides[index].visible = false
	
