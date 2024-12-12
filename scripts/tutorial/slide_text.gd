extends Control
	
func _on_next_pressed() -> void:
	signals.next_page.emit()     


func _on_previous_pressed() -> void:
	signals.previous_page.emit()
