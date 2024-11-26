class_name EnabledState
extends CardState


func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready
	
	# TODO delete this later, probably
	card_ui.reparent_requested.emit(card_ui)
	card_ui.enable_input()
	
	print("entered enabled/base state")


func on_gui_input(event:InputEvent) -> void:
	if event.is_action_pressed("click"):
		print("leaving enabled/base")
		transition_requested.emit(self, CardState.State.SELECTED)


func exit() -> void:
	pass


func transition_to_disabled() -> void:
	transition_requested.emit(self, CardState.State.DISABLED)
