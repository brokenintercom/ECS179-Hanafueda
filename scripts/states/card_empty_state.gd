class_name EmptyState
extends CardState


func _ready() -> void:
	state = CardState.State.EMPTY


func enter() -> void:
	card_ui.update_card(CardSpecFactory.empty_card_spec)
	card_ui.disable_input()


func exit() -> void:
	pass


func transition_to_enabled(spec:CardSpec) -> void:
	card_ui.update_card(spec)
	transition_requested.emit(self, CardState.State.ENABLED)


func transition_to_empty() -> void:
	# Do nothing
	pass
