class_name CardSpecFactory
extends Node

static var empty_card_spec := CardSpec.new(CardSpec.Month.NONE, CardSpec.Type.NONE, CardSpec.Synergy.NONE, load("res://assets/icon.svg"))
# TODO update with actual empty spot asset


static func card_to_spec(card:Card) -> CardSpec:
	return CardSpec.new(card.month, card.type, card.synergy, card.texture_normal)