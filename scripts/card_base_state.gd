extends CardState


func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready
	
	card_ui.reparent_requested.emit(card_ui)
	card_ui.is_selected = false
	card_ui.highlight.visible = false
	
	print("entered base state")


func on_gui_input(event:InputEvent) -> void:
	if event.is_action_pressed("click"):
		print("leaving base")
		transition_requested.emit(self, CardState.State.SELECTED)
