extends Control
## based on dialogue box tutorial by DashNothing
## https://www.youtube.com/watch?v=1DRy5An_6DU&ab_channel=DashNothing

	
func _on_next_pressed() -> void:
	signals.next_page.emit()     


func _on_previous_pressed() -> void:
	signals.previous_page.emit()