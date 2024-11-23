class_name CardSpecFactory
extends Node

static var empty_card_spec := CardSpec.new(CardSpec.Month.EMPTY, CardSpec.Type.EMPTY, CardSpec.Synergy.NONE, preload("res://assets/icon.svg"))
# TODO update with actual empty spot asset


static func card_to_spec(card:Card) -> CardSpec:
	return CardSpec.new(card.month, card.type, card.synergy, card.sprite.texture)
	
	
