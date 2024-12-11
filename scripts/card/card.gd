class_name Card
extends TextureButton

signal reparent_requested(which_card_ui: Card)
const WHITE := Color.WHITE
const GRAY := Color.WEB_GRAY
@export var month:CardSpec.Month
@export var type:CardSpec.Type
@export var synergy:CardSpec.Synergy
var index := -1  # Index within its month
@onready var highlight:Sprite2D = $Highlight
@onready var state_machine:CardStateMachine = $CardStateMachine


func _ready() -> void:
	if month == CardSpec.Month.NONE:
		modulate = GRAY
	else:
		modulate = WHITE
	
	state_machine.setup(self)


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
	index = spec.index


func disable_input() -> void:
	disabled = true
	modulate = GRAY
	highlight.visible = false


func enable_input() -> void:
	disabled = false
	modulate = WHITE
	highlight.visible = false


func is_selected() -> bool:
	return state_machine.curr_card_state.state == CardState.State.SELECTED


func is_empty() -> bool:
	return get_curr_card_state().state == CardState.State.EMPTY


func matches_month(month_to_match:CardSpec.Month) -> bool:
	return month == month_to_match


func matches_type(type_to_match:CardSpec.Type) -> bool:
	return type == type_to_match


func matches_synergy(synergy_to_match:CardSpec.Synergy) -> bool:
	return synergy == synergy_to_match
