extends Control
## based on dialogue box tutorial by DashNothing
## https://www.youtube.com/watch?v=1DRy5An_6DU&ab_channel=DashNothing


@onready var label = $Panel/Label
@onready var timer = $LetterDisplayTimer

const MAX_WIDTH = 970

var text = ""
var letter_index:int= 0

var letter_time:int = 0.03
var space_time = 0.06
var punctuation_time = 0.2

# When we've reached the end of the text, stop adding text to text box
signal finished_displaying()

# display text onto the label
func display_text(text_to_display:String) -> void:
	text = text_to_display
	label.text = text_to_display
	label.text = ""
	_display_letter()
		
# Add a single letter to the label one by one
func _display_letter():
	label.text += text[letter_index]
	letter_index += 1
	if letter_index >= text.length():
		finished_displaying.emit()
		return
		
	match text[letter_index]:
		"!", ".", ",", "?":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)

func _on_letter_display_timer_timeout() -> void:
	_display_letter()
	
func _on_next_pressed() -> void:
	signals.next_page.emit()
