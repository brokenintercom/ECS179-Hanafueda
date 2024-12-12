class_name DeckView
extends CanvasLayer


func _on_done_pressed() -> void:
	deck_view.visible = false


func reset() -> void:
	var month_containers := $DeckView/Cards.get_children()
	
	for month in month_containers:
		var cards := month.get_children()
		
		for i in range(1, 5):
			cards[i].modulate = player.WHITE
