extends Control
## based on dialogue box tutorial by DashNothing
## https://www.youtube.com/watch?v=1DRy5An_6DU&ab_channel=DashNothing


@onready var label = $Panel/Label
@onready var timer = $LetterDisplayTimer

	
func _on_next_pressed() -> void:
	signals.next_page.emit()     
	$Panel/show_text.play('show')


func _on_previous_pressed() -> void:
	signals.previous_page.emit()
