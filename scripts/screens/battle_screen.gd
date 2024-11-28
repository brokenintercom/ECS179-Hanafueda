class_name BattleScreen
extends Node

enum PhaseType {
	PLAYER,
	ENEMY,
}

@export var _num_turns_left:int

@onready var playbtn := $PlayCardsButton

var _curr_phase := PhaseType.PLAYER
var _drew_cards := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signals.switch_battle_phase.connect(_on_switch_battle_phase)
	player.hand.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if len(player.selected_cards) == 0:
		playbtn.disabled = true
	else:
		playbtn.disabled = false
	
	if _curr_phase == PhaseType.ENEMY:
		# TODO Maybe some state machine stuff bc drawing cards is only for the player...emit signal?
		# TODO Jamie: disable player button input (this can also be done during the battle phase switch signal, probably a better idea)
		_drew_cards = false
		print("Enemy current health:", enemy.curr_health)
		
		if enemy.curr_health <= 0:
			print("Switching to win screen...")
			signals.switch_scene.emit("win")
		else:
			enemy.temp_func()
	elif _curr_phase == PhaseType.PLAYER:
		# TODO Jamie: reenable player button input, or probably better to do in battle phase switch signal
		
		# TODO could do "else" but technically for future development I am putting an elif...
		if _num_turns_left == 0 or player.curr_health <= 0:
			print("Number of turns left:", _num_turns_left)
			print("Player current health:", player.curr_health)
			print("Switching to lose screen...")
			# TODO need to decrement num turns left in enemy script
			signals.switch_scene.emit("lose")
		elif not _drew_cards:
			# Draw enough cards such that the player's hand would have max_hand_size cards
			var num_draw:int = player.hand.max_hand_size - player.hand.num_cards
			player.draw_cards(num_draw)
			_drew_cards = true


func _on_switch_battle_phase() -> void:
	# Player turn just ended
	if _curr_phase == PhaseType.PLAYER:
		_curr_phase = PhaseType.ENEMY
		# TODO @Jamie: Disable player input.
	else:  # Enemy turn just ended
		# TODO re-enable player input
		_curr_phase = PhaseType.PLAYER
		# TODO Jamie: update UI too
		_num_turns_left -= 1


# TODO modify later
func _on_title_screen_button_pressed() -> void:
	print("Switching to title screen...")
	signals.switch_scene.emit("title_screen")


func _on_play_cards_button_pressed() -> void:
	player.play_cards()
