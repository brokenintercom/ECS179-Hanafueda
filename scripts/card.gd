class_name Card
extends Control

@export var month:CardSpec.Month
@export var type:CardSpec.Type
@export var synergy:CardSpec.Synergy
@export var texture:Texture

# TODO @Jamie: empty cards cannot be selected

var is_selected := false
# TODO attach this script to every instance of this card? or it can have a path to its image


func update_card(spec:CardSpec) -> void:
	month = spec.month
	type = spec.type
	synergy = spec.synergy
	texture = spec.texture
# TODO look for an InputEvent for when the card is clicked on (need collision shape)
# TODO then the card should be outlined in blue to indicate it's selected (and set is_selected)

# TODO also, look for an InputEvent for when the mouse hovers over a card
# TODO on_mouse_entered and on_mouse_exited signals
