extends CanvasLayer
## Based off of Exercise 2's camera controller

@export var displays:Array[Node]
var curr_display:int = 0

func _ready() -> void:
	signals.display_jan.connect(_display_jan)
	signals.display_feb.connect(_display_feb)
	signals.display_mar.connect(_display_mar)
	signals.display_apr.connect(_display_apr)
	signals.display_may.connect(_display_may)
	signals.display_jun.connect(_display_jun)
	signals.display_jul.connect(_display_jul)
	signals.display_aug.connect(_display_aug)
	signals.display_sep.connect(_display_sep)
	signals.display_oct.connect(_display_oct)
	signals.display_nov.connect(_display_nov)
	signals.display_dec.connect(_display_dec)
	
	# Set every display to !visible at the beginning
	for display in displays:
		if display != null:
			display.visible = false
	
# When the player clicks the January button, show the january cards display
func _display_jan() -> void:
	curr_display = 0
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false

# When the player clicks the February button, show the February cards display
func _display_feb() -> void:
	curr_display = 1
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false

# When the player clicks the March button, show the March cards display
func _display_mar() -> void:
	curr_display = 2
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false
				
# When the player clicks the April button, show the April cards display
func _display_apr() -> void:
	curr_display = 3
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false
				
# When the player clicks the May button, show the May cards display
func _display_may() -> void:
	curr_display = 4
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false
				
# When the player clicks the June button, show the June cards display
func _display_jun() -> void:
	curr_display = 5
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false
				
# When the player clicks the July button, show the July cards display
func _display_jul() -> void:
	curr_display = 6
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false
				
# When the player clicks the August button, show the August cards display
func _display_aug() -> void:
	curr_display = 7
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false
				
# When the player clicks the September button, show the September cards display
func _display_sep() -> void:
	curr_display = 8
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false
				
# When the player clicks the October button, show the October cards display
func _display_oct() -> void:
	curr_display = 9
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false
				
# When the player clicks the November button, show the November cards display
func _display_nov() -> void:
	curr_display = 10
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false

# When the player clicks the December button, show the December cards display
func _display_dec() -> void:
	curr_display = 11
	
	for index in len(displays):
		if displays[index] != null:
			if index == curr_display:
				displays[curr_display].visible = true
			else:
				displays[index].visible = false
