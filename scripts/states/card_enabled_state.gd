# CREDITS: following code is based off of GodotGameLab's Tutorial
# link: https://youtu.be/Pa0P1lUoC-M

class_name EnabledState
extends CardState


func _ready() -> void:
	state = CardState.State.ENABLED


func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready
	
	# TODO delete this later, probably
	#card_ui.reparent_requested.emit(card_ui)
	card_ui.enable_input()


func on_gui_input(event:InputEvent) -> void:
	# TODO also, look for an InputEvent for when the mouse hovers over a card
	# TODO on_mouse_entered and on_mouse_exited signals

	if event.is_action_pressed("click"):
		transition_requested.emit(self, CardState.State.SELECTED)


func exit() -> void:
	pass


func transition_to_disabled() -> void:
	transition_requested.emit(self, CardState.State.DISABLED)
