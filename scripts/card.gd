class_name Card
extends TextureButton

@export var month:CardSpec.Month
@export var type:CardSpec.Type
@export var synergy:CardSpec.Synergy

signal reparent_requested(which_card_ui: Card)

const WHITE := Color.WHITE
const GRAY := Color.WEB_GRAY

@onready var highlight:ColorRect = $ColorRect
@onready var state_machine:CardStateMachine = $CardStateMachine

# TODO attach this script to every instance of this card? or it can have a path to its image

func _ready() -> void:
	if texture_normal == CardSpecFactory.empty_card_spec.texture:
		print("Gray")
		modulate = GRAY
	else:
		print("White")
		modulate = WHITE
	
	state_machine.setup(self)


#func _input(event:InputEvent) -> void:
	##print("event is ", event)
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#print("do something")


func _on_gui_input(event:InputEvent) -> void:
	state_machine.on_gui_input(event)


func get_curr_card_state() -> CardState:
	return state_machine.curr_card_state


func update_card(spec:CardSpec) -> void:
	# Use the given spec to update the card's attributes
	month = spec.month
	type = spec.type
	synergy = spec.synergy
	texture_normal = spec.texture


func disable_input() -> void:
	disabled = true
	modulate = GRAY
	highlight.visible = false


func enable_input() -> void:
	disabled = false
	modulate = WHITE
	highlight.visible = false


func is_selected() -> bool:
	# Same as checking state_machine.curr_card_state.state == CardState.State.SELECTED
	return highlight.visible


func is_empty() -> bool:
	return modulate.is_equal_approx(GRAY)


func matches_month(month_to_match:CardSpec.Month) -> bool:
	return month == month_to_match


func matches_type(type_to_match:CardSpec.Type) -> bool:
	return type == type_to_match


func matches_synergy(synergy_to_match:CardSpec.Synergy) -> bool:
	print("synergy_to_match: ", synergy_to_match)
	return synergy == synergy_to_match
