class_name Card
extends TextureButton

@export var month:CardSpec.Month
@export var type:CardSpec.Type
@export var synergy:CardSpec.Synergy

signal reparent_requested(which_card_ui: Card)

const WHITE := Color.WHITE
const GRAY := Color.WEB_GRAY

@onready var highlight:ColorRect = $ColorRect
@onready var state_machine: CardStateMachine = $CardStateMachine as CardStateMachine

# TODO attach this script to every instance of this card? or it can have a path to its image

func _ready() -> void:
	# TODO says the base is NIL when I change init() to _init()
	state_machine.init(self)
	highlight.visible = false


func _on_gui_input(event:InputEvent) -> void:
	state_machine.on_gui_input(event)


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
	# Synonymous with checking self.state_machine.curr_card_state.state == CardState.SELECTED
	return highlight.visible  


func is_empty() -> bool:
	return modulate == GRAY


func does_match(category_match:Hand.Match) -> bool:
	return (
		(category_match == Hand.Match.MONTH and month == category_match) 
		or (category_match == Hand.Match.TYPE and type == category_match)
	)
	#sprite.texture = spec.texture
# TODO look for an InputEvent for when the card is clicked on (need collision shape)
# TODO then the card should be outlined in blue to indicate it's selected (and set is_selected)

# TODO also, look for an InputEvent for when the mouse hovers over a card
# TODO on_mouse_entered and on_mouse_exited signals
