class_name SelectedState
extends CardState

@onready var _player := %Player
@onready var _hand := %Hand

func enter() -> void:
	card_ui.highlight.visible = true
	
	# TODO Yoobin: Bug with player and hand being a null instance
	var spec_version := CardSpecFactory.card_to_spec(card_ui)
	_player.selected_cards.append(spec_version)
	
	_hand.update_matches(_player.selected_cards)
	print("entered selected state")


func on_gui_input(event:InputEvent) -> void:
	if event.is_action_pressed("click"):
		# TODO Yoobin: remove the card from selected_cards using erase()
		transition_requested.emit(self, CardState.State.ENABLED)
