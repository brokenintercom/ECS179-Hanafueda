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
	player.health_bar.visible = true
	enemy.health_bar.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if len(player.selected_cards) == 0:
		playbtn.disabled = true
	else:
		playbtn.disabled = false
	
	if _curr_phase == PhaseType.ENEMY:
		if enemy.curr_health <= 0:
			_cleanup(true)
		else:
			enemy.enemy_actions()
	elif _curr_phase == PhaseType.PLAYER:
		# TODO Jamie: reenable player button input, or probably better to do in battle phase switch signal
		
		# TODO could do "else" but technically for future development I am putting an elif...
		if _num_turns_left == 0 or player.curr_health <= 0 or player.deck.is_empty():
			print("Number of turns left:", _num_turns_left)
			_cleanup(false)
		elif not _drew_cards:
			# Draw enough cards such that the player's hand would have max_hand_size cards
			var num_draw:int = player.hand.max_hand_size - player.hand.num_cards
			player.draw_cards(num_draw)
			_drew_cards = true


func _on_switch_battle_phase() -> void:
	# Player turn just ended
	if _curr_phase == PhaseType.PLAYER:
		_curr_phase = PhaseType.ENEMY
		# TODO @Jamie: Disable player input if needed
	else:  # Enemy turn just ended
		# TODO re-enable player input if needed
		_curr_phase = PhaseType.PLAYER
		# TODO Jamie: update UI too
		_num_turns_left -= 1
		_drew_cards = false


# TODO modify later
func _on_title_screen_button_pressed() -> void:
	print("Switching to title screen...")
	signals.switch_scene.emit("title_screen")


func _on_play_cards_button_pressed() -> void:
	player.play_cards()


func _cleanup(player_won:bool) -> void:
	player.hand.visible = false
	player.health_bar.visible = false
	# TODO it claims this was freed already, so it's commented out...: enemy.health_bar.visible = false
	
	if player_won:
		signals.switch_scene.emit("win_screen")
	else:
		signals.switch_scene.emit("lose_screen")
