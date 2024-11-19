class_name DamageEngine
extends Node

static var DMG_GRID  # TODO 2D array


static func calc_dmg(attacking_card:Card, target_card:Card) -> float:
	if randi_range(0, 1) < attacking_card.accuracy:
		return DMG_GRID[attacking_card.type][target_card.type] * attacking_card.attack
	else:  # Attack missed
		return 0.0
