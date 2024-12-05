class_name DamageEngine
extends Node

# By default, NONE does 0, NORMAL does 1, RIBBON does 2, ANIMAL 3, BRIGHT 5
static var type_dmg_grid := [0, 1, 2, 3, 5]


static func calc_dmg(selected_cards:Array[CardSpec], category:Hand.Match, atk_multiplier:float) -> int:
	var num_selected := len(selected_cards)
	
	# Sanity check
	if num_selected == 0:
		return 0
	
	var base_dmg := 0
	var month_multiplier := 1
	var bonus_dmg := 0 
	
	# TODO delete print statements
	print("--------DAMAGE ENGINE--------")
	
	# Matching by month -- you can also get an effect multiplier
	if category == Hand.Match.MONTH:
		print("Calculating by month...")
		if num_selected == CardSpec.MAX_MONTH_CARDS:
			month_multiplier = 2
		
		# Depending on the card's type, we add a diff amount of dmg
		for card in selected_cards:
			base_dmg += type_dmg_grid[card.type]  # Use type to index into the grid
	else:  
		# Matching by type instead. Also includes Hand.Match.BOTH, where you prioritize matching by type
		# All the same type, so they all add the same amount of dmg, so you can get flat bonus dmg increase
		print("Calculating by type...")
		base_dmg = type_dmg_grid[selected_cards[0].type] * num_selected
		
		bonus_dmg = _calc_bonus_dmg(type_dmg_grid[selected_cards[0].type], num_selected)
	
	print("Base damage: ", base_dmg)
	print("Month multiplier: ", month_multiplier)
	print("Attack multiplier: ", atk_multiplier)
	print("Bonus damage: ", bonus_dmg)
	print("Result: ", (base_dmg * month_multiplier * atk_multiplier) + bonus_dmg)
	
	return (base_dmg * month_multiplier * atk_multiplier) + bonus_dmg


static func _calc_bonus_dmg(type:CardSpec.Type, num_selected:int) -> int:
	var threshold := 0
	
	match type:
		CardSpec.Type.NONE:
			return 0
		CardSpec.Type.NORMAL:
			threshold = 3
		CardSpec.Type.RIBBON:
			threshold = 2
		CardSpec.Type.ANIMAL:
			threshold = 2
		CardSpec.Type.BRIGHT:
			threshold = 1
	
	var bonus_dmg = num_selected - threshold
	
	# If less than threshold, no bonus
	if bonus_dmg < 0:
		bonus_dmg = 0
	
	# If you have more than 1 bright, multiply the bonus dmg by 2
	if type == CardSpec.Type.BRIGHT:
		bonus_dmg *= 2
	
	return bonus_dmg
