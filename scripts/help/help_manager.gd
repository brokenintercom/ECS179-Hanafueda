extends CanvasLayer
## Based off of Exercise 2's camera controller

@export var displays:Array[Node]
var curr_display:int = 0

func _ready() -> void:
	signals.show_guide.connect(_show_guide)
	signals.display.connect(_on_display)
	
	# Set every display to !visible at the beginning
	for display in displays:
		if display != null:
			display.visible = false


func _show_guide() -> void:
	if self.visible == false:
		self.visible = true
	else:
		self.visible = false


func _on_display(new_display:int) -> void:
	curr_display = new_display
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false


func _on_help_button_pressed() -> void:
	
	for display in displays:
		if display != null:
			display.visible = false
			
	signals.show_guide.emit()
