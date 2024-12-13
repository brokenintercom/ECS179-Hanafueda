# CREDITS: following code is based off of GodotGameLab's Tutorial
# link: https://youtu.be/Pa0P1lUoC-M

class_name EnabledState
extends CardState


func _ready() -> void:
	state = CardState.State.ENABLED


func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready
	
	card_ui.enable_input()


func on_gui_input(event:InputEvent) -> void:
	if event.is_action_pressed("click"):
		transition_requested.emit(self, CardState.State.SELECTED)


func exit() -> void:
	pass


func transition_to_disabled() -> void:
	transition_requested.emit(self, CardState.State.DISABLED)
