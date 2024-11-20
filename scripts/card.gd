class_name Card
extends Control



@export var month:CardSpec.Month
@export var type:CardSpec.Type
@export var texture:Texture

# TODO @Jamie: empty cards cannot be selected

var is_selected := false
# TODO attach this script to every instance of this card? or it can have a path to its image


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func update_card(spec:CardSpec) -> void:
	month = spec.month
	type = spec.type
	texture = spec.texture
# TODO look for an InputEvent for when the card is clicked on (need collision shape)
# TODO then the card should be outlined in blue to indicate it's selected (and set is_selected)

# TODO also, look for an InputEvent for when the mouse hovers over a card
# TODO on_mouse_entered and on_mouse_exited signals
