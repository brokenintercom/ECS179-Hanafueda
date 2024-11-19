class_name PlayerParty
extends Node

static var party:Dictionary
const MAX_PARTY_SIZE := 6


# Return whether or not adding a member was successful
static func recruit_member(member:Card) -> bool:
	if party.size() < MAX_PARTY_SIZE:
		# Search up party members by their name
		party[member.card_name] = member
		return true
	else:
		return false


# Returns whether sacrifice was successful
static func sacrfice_member(member:Card) -> void:
	return party.erase(member.card_name)
