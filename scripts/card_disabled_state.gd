class_name DisabledState
extends CardState


func enter() -> void:
	card_ui.disable_input()


func exit() -> void:
	pass

func transition_to_enabled() -> void:
	transition_requested.emit(self, CardState.State.ENABLED)
