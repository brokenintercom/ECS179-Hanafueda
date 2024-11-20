class_name CardSpec
extends Node

enum Month {
	JAN,
	FEB,  # TODO add more
	EMPTY,
}

enum Type {
	NORMAL,
	RIBBON,
	ANIMAL,
	BRIGHT,  # TODO add more
	EMPTY,
}

enum Synergy {
	NONE,  # TODO add more
}

var month:Month
var type:Type
var synergy:Synergy
var texture:Texture


func _init(new_month:Month, new_type:Type, new_synergy:Synergy, new_texture:Texture) -> void:
	self.month = new_month
	self.type = new_type
	self.synergy = new_synergy
	self.texture = new_texture
