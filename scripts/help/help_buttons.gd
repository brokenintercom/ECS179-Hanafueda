extends Control


func _on_card_types_pressed() -> void:
	signals.display.emit(0)


func _on_combos_pressed() -> void:
	signals.display.emit(1)


func _on_january_pressed() -> void:
	signals.display.emit(2)  


func _on_february_pressed() -> void:
	signals.display.emit(3)   


func _on_march_pressed() -> void:
	signals.display.emit(4)   


func _on_april_pressed() -> void:
	signals.display.emit(5)    


func _on_may_pressed() -> void:
	signals.display.emit(6)  


func _on_june_pressed() -> void:
	signals.display.emit(7)


func _on_july_pressed() -> void:
	signals.display.emit(8)   


func _on_august_pressed() -> void:
	signals.display.emit(9)   


func _on_september_pressed() -> void:
	signals.display.emit(10)   


func _on_october_pressed() -> void:
	signals.display.emit(11)   


func _on_november_pressed() -> void:
	signals.display.emit(12)   


func _on_december_pressed() -> void:
	signals.display.emit(13) 
