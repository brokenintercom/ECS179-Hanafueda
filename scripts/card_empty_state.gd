class_name EmptyState
extends CardState


func enter() -> void:
	card_ui.update_card(CardSpecFactory.empty_card_spec)
	card_ui.disable_input()
	print("entered empty state")


func exit() -> void:
	pass


func transition_to_enabled() -> void:
	transition_requested.emit(self, CardState.State.ENABLED)
