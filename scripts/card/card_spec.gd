class_name CardSpec
extends Node

const MAX_MONTH_CARDS := 4
const MAX_SYNERGY_CARDS := 3

enum Month {
	NONE,
	JAN,
	FEB,
	MAR,
	APR,
	MAY,
	JUN,
	JUL,
	AUG,
	SEP,
	OCT,
	NOV,
	DEC,
}

enum Type {
	NONE,
	NORMAL,
	RIBBON,
	ANIMAL,
	BRIGHT,
}

enum Synergy {
	NONE,
	BLUE_RIBBON,
	POETRY_RIBBON,
	INO_SHIKA_CHO,  # Butterfly, Deer, Boar
}

var month:Month
var type:Type
var synergy:Synergy
var texture:Texture2D
var index:int


func _init(new_month:Month, new_type:Type, new_synergy:Synergy, new_texture:Texture, new_index) -> void:
	self.month = new_month
	self.type = new_type
	self.synergy = new_synergy
	self.texture = new_texture
	self.index = new_index
