# CREDITS: following code is based off of GodotGameLab's Tutorial
# link: https://youtu.be/Pa0P1lUoC-M

extends CardState

var spec_version:CardSpec
@onready var deck_cards := deck_view.get_node("DeckView/Cards").get_children()

func _ready() -> void:
	state = CardState.State.SELECTED


func enter() -> void:
	card_ui.highlight.visible = true
	spec_version = CardSpecFactory.card_to_spec(card_ui)
	player.selected_cards.append(spec_version)
	player.hand.update_matches(player.selected_cards)


func on_gui_input(event:InputEvent) -> void:
	if event.is_action_pressed("click"):
		var index:int = player.selected_cards.find(spec_version)
		
		if index == -1:
			return
		else:
			# Card was deselected, so erase from selected_cards array
			# and transition this card's state to ENABLED
			player.selected_cards.erase(spec_version)
			
			transition_to_enabled()


func transition_to_enabled() -> void:
	# Card is now a possible match -- check/update the cards!
	player.hand.update_matches(player.selected_cards)
	transition_requested.emit(self, CardState.State.ENABLED)


func transition_to_empty() -> void:
	# Just played the card, so it's no longer selected
	player.selected_cards.erase(spec_version)
	
	# Mark card as used in the deck view
	if spec_version.month != CardSpec.Month.NONE and spec_version.index != -1:
		var month_index := spec_version.month - 1
		deck_cards[month_index].get_children()[spec_version.index].modulate = player.GRAY
	
	super()
