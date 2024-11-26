class_name Card
extends Control

@export var month:CardSpec.Month
@export var type:CardSpec.Type
@export var synergy:CardSpec.Synergy

signal reparent_requested(which_card_ui: Card)

#@onready var sprite:Sprite2D = $Sprite2D
@onready var highlight:ColorRect = $Highlight
@onready var greyout:ColorRect = $Greyout
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine
# TODO @Jamie: empty cards cannot be selected

var is_selected := false
# TODO attach this script to every instance of this card? or it can have a path to its image

func _ready() -> void:
	card_state_machine.init(self)


func _on_gui_input(event:InputEvent) -> void:
	card_state_machine.on_gui_input(event)


func update_card(spec:CardSpec) -> void:
	# Use the given spec to update the card's attributes
	month = spec.month
	type = spec.type
	synergy = spec.synergy
	#sprite.texture = spec.texture
# TODO look for an InputEvent for when the card is clicked on (need collision shape)
# TODO then the card should be outlined in blue to indicate it's selected (and set is_selected)

# TODO also, look for an InputEvent for when the mouse hovers over a card
# TODO on_mouse_entered and on_mouse_exited signals

func set_greyout(is_disabled:bool) -> void:
	greyout.visible= is_disabled
	
