extends CardState


func enter() -> void:
	card_ui.is_selected = true
	card_ui.highlight.visible = true
	
	print("entered selected state")


func on_gui_input(event:InputEvent) -> void:
	if event.is_action_pressed("click"):
		transition_requested.emit(self, CardState.State.BASE)
